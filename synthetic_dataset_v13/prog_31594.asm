; DESCRIPTION: Draws a red line from (104, 160) to (124, 125).
; PLAN: r0=104(x1), r1=160(y1), r2=124(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 160
LDI r2, 124
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
