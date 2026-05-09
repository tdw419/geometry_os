; DESCRIPTION: Renders a blue line between points (499, 144) and (87, 248).
; PLAN: r0=499(x1), r1=144(y1), r2=87(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 144
LDI r2, 87
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
