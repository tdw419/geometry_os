; DESCRIPTION: Renders a purple line between points (510, 196) and (254, 47).
; PLAN: r0=510(x1), r1=196(y1), r2=254(x2), r3=47(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 196
LDI r2, 254
LDI r3, 47
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
