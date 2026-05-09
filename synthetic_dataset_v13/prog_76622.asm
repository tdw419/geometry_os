; DESCRIPTION: Draws a black line from (248, 248) to (430, 171).
; PLAN: r0=248(x1), r1=248(y1), r2=430(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 248
LDI r2, 430
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
