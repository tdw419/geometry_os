; DESCRIPTION: Draws a green line from (96, 131) to (104, 177).
; PLAN: r0=96(x1), r1=131(y1), r2=104(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 131
LDI r2, 104
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
