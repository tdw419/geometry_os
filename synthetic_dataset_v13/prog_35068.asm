; DESCRIPTION: Places a blue line segment connecting (432, 221) to (236, 177).
; PLAN: r0=432(x1), r1=221(y1), r2=236(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 221
LDI r2, 236
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
