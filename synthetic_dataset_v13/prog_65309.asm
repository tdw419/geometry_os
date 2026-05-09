; DESCRIPTION: Draws a red line from (197, 234) to (459, 218).
; PLAN: r0=197(x1), r1=234(y1), r2=459(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 234
LDI r2, 459
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
