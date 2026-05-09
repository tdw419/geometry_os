; DESCRIPTION: Renders a purple line between points (470, 50) and (243, 196).
; PLAN: r0=470(x1), r1=50(y1), r2=243(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 50
LDI r2, 243
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
