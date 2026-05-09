; DESCRIPTION: Renders a purple box of size 99x48 starting at (395, 181).
; PLAN: r0=395(x), r1=181(y), r2=99(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 181
LDI r2, 99
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
