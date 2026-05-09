; DESCRIPTION: Draws a black line from (433, 53) to (407, 170).
; PLAN: r0=433(x1), r1=53(y1), r2=407(x2), r3=170(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 53
LDI r2, 407
LDI r3, 170
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
