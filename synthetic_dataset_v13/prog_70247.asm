; DESCRIPTION: Draws a blue line from (199, 196) to (260, 69).
; PLAN: r0=199(x1), r1=196(y1), r2=260(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 196
LDI r2, 260
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
