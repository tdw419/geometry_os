; DESCRIPTION: Draws a black line from (260, 186) to (10, 178).
; PLAN: r0=260(x1), r1=186(y1), r2=10(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 186
LDI r2, 10
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
