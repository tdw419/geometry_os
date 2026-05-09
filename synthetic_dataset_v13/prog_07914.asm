; DESCRIPTION: Draws a black line from (70, 46) to (376, 106).
; PLAN: r0=70(x1), r1=46(y1), r2=376(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 46
LDI r2, 376
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
