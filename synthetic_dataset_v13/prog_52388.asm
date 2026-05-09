; DESCRIPTION: Draws a red line from (132, 207) to (298, 145).
; PLAN: r0=132(x1), r1=207(y1), r2=298(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 207
LDI r2, 298
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
