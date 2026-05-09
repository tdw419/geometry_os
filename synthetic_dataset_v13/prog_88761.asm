; DESCRIPTION: Draws a black line from (330, 5) to (355, 249).
; PLAN: r0=330(x1), r1=5(y1), r2=355(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 5
LDI r2, 355
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
