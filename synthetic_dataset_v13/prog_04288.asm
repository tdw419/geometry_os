; DESCRIPTION: Draws a black line from (380, 233) to (106, 20).
; PLAN: r0=380(x1), r1=233(y1), r2=106(x2), r3=20(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 233
LDI r2, 106
LDI r3, 20
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
