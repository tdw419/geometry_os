; DESCRIPTION: Draws a black line from (465, 153) to (248, 34).
; PLAN: r0=465(x1), r1=153(y1), r2=248(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 153
LDI r2, 248
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
