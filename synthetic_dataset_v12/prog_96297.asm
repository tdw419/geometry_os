; DESCRIPTION: Renders a purple box of size 99x80 starting at (363, 85).
; PLAN: r0=363(x), r1=85(y), r2=99(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 85
LDI r2, 99
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
