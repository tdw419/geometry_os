; DESCRIPTION: Draws a red line from (387, 165) to (381, 51).
; PLAN: r0=387(x1), r1=165(y1), r2=381(x2), r3=51(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 165
LDI r2, 381
LDI r3, 51
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
