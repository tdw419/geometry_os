; DESCRIPTION: Renders a cyan box of size 66x108 starting at (304, 63).
; PLAN: r0=304(x), r1=63(y), r2=66(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 63
LDI r2, 66
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
