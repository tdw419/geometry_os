; DESCRIPTION: Renders a purple box of size 38x110 starting at (10, 47).
; PLAN: r0=10(x), r1=47(y), r2=38(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 47
LDI r2, 38
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
