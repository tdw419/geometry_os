; DESCRIPTION: Draws a black line from (369, 146) to (276, 55).
; PLAN: r0=369(x1), r1=146(y1), r2=276(x2), r3=55(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 146
LDI r2, 276
LDI r3, 55
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
