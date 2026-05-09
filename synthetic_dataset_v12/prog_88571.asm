; DESCRIPTION: Renders a blue line between points (323, 196) and (291, 164).
; PLAN: r0=323(x1), r1=196(y1), r2=291(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 196
LDI r2, 291
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
