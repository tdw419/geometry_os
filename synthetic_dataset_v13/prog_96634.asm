; DESCRIPTION: Draws a blue line from (17, 200) to (228, 179).
; PLAN: r0=17(x1), r1=200(y1), r2=228(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 200
LDI r2, 228
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
