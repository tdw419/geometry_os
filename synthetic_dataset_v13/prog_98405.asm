; DESCRIPTION: Renders a orange line between points (96, 252) and (321, 236).
; PLAN: r0=96(x1), r1=252(y1), r2=321(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 252
LDI r2, 321
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
