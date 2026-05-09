; DESCRIPTION: Renders a purple box of size 99x20 starting at (229, 13).
; PLAN: r0=229(x), r1=13(y), r2=99(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 13
LDI r2, 99
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
