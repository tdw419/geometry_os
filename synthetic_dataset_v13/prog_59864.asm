; DESCRIPTION: Renders a black box of size 99x79 starting at (205, 147).
; PLAN: r0=205(x), r1=147(y), r2=99(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 147
LDI r2, 99
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
