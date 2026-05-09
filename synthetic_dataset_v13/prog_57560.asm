; DESCRIPTION: Renders a purple line between points (320, 45) and (87, 92).
; PLAN: r0=320(x1), r1=45(y1), r2=87(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 45
LDI r2, 87
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
