; DESCRIPTION: Draws a black line from (208, 72) to (54, 37).
; PLAN: r0=208(x1), r1=72(y1), r2=54(x2), r3=37(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 72
LDI r2, 54
LDI r3, 37
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
