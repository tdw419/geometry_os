; DESCRIPTION: Draws a red line from (325, 60) to (198, 45).
; PLAN: r0=325(x1), r1=60(y1), r2=198(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 60
LDI r2, 198
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
