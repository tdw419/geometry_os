; DESCRIPTION: Renders a black line between points (174, 205) and (10, 252).
; PLAN: r0=174(x1), r1=205(y1), r2=10(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 205
LDI r2, 10
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
