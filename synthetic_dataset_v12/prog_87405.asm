; DESCRIPTION: Renders a blue line between points (320, 80) and (177, 200).
; PLAN: r0=320(x1), r1=80(y1), r2=177(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 80
LDI r2, 177
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
