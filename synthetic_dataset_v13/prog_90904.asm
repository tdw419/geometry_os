; DESCRIPTION: Renders a blue box of size 46x65 starting at (417, 99).
; PLAN: r0=417(x), r1=99(y), r2=46(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 99
LDI r2, 46
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
