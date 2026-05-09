; DESCRIPTION: Draws a black line from (187, 73) to (400, 252).
; PLAN: r0=187(x1), r1=73(y1), r2=400(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 73
LDI r2, 400
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
