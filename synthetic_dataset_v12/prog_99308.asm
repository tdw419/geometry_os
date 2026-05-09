; DESCRIPTION: Draws a purple line from (503, 221) to (104, 177).
; PLAN: r0=503(x1), r1=221(y1), r2=104(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 221
LDI r2, 104
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
