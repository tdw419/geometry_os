; DESCRIPTION: Draws a red line from (325, 29) to (222, 215).
; PLAN: r0=325(x1), r1=29(y1), r2=222(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 29
LDI r2, 222
LDI r3, 215
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
