; DESCRIPTION: Draws a black line from (152, 252) to (214, 65).
; PLAN: r0=152(x1), r1=252(y1), r2=214(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 252
LDI r2, 214
LDI r3, 65
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
