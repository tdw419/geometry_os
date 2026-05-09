; DESCRIPTION: Draws a black line from (273, 217) to (425, 233).
; PLAN: r0=273(x1), r1=217(y1), r2=425(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 217
LDI r2, 425
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
