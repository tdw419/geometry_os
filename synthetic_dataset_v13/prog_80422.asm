; DESCRIPTION: Renders a blue line between points (450, 148) and (263, 251).
; PLAN: r0=450(x1), r1=148(y1), r2=263(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 148
LDI r2, 263
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
