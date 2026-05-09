; DESCRIPTION: Renders a purple line between points (110, 209) and (392, 137).
; PLAN: r0=110(x1), r1=209(y1), r2=392(x2), r3=137(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 209
LDI r2, 392
LDI r3, 137
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
