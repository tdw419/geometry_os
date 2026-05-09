; DESCRIPTION: Draws a blue line from (352, 101) to (398, 137).
; PLAN: r0=352(x1), r1=101(y1), r2=398(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 101
LDI r2, 398
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
