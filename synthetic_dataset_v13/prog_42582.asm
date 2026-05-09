; DESCRIPTION: Draws a black line from (330, 10) to (271, 106).
; PLAN: r0=330(x1), r1=10(y1), r2=271(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 10
LDI r2, 271
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
