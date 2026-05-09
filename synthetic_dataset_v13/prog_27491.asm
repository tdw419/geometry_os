; DESCRIPTION: Draws a black line from (368, 243) to (260, 178).
; PLAN: r0=368(x1), r1=243(y1), r2=260(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 243
LDI r2, 260
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
