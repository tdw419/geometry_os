; DESCRIPTION: Draws a black line from (103, 201) to (135, 135).
; PLAN: r0=103(x1), r1=201(y1), r2=135(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 201
LDI r2, 135
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
