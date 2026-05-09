; DESCRIPTION: Draws a red line from (382, 104) to (50, 219).
; PLAN: r0=382(x1), r1=104(y1), r2=50(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 104
LDI r2, 50
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
