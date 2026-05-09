; DESCRIPTION: Draws a black line from (342, 233) to (264, 34).
; PLAN: r0=342(x1), r1=233(y1), r2=264(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 233
LDI r2, 264
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
