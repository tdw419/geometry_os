; DESCRIPTION: Renders a cyan box of size 108x66 starting at (304, 46).
; PLAN: r0=304(x), r1=46(y), r2=108(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 46
LDI r2, 108
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
