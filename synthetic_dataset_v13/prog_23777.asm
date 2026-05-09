; DESCRIPTION: Draws a red line from (459, 214) to (270, 64).
; PLAN: r0=459(x1), r1=214(y1), r2=270(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 214
LDI r2, 270
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
