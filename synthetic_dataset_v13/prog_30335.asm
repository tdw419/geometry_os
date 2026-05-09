; DESCRIPTION: Renders a cyan box of size 66x57 starting at (111, 46).
; PLAN: r0=111(x), r1=46(y), r2=66(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 46
LDI r2, 66
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
