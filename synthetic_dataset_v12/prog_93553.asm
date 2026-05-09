; DESCRIPTION: Renders a orange line between points (236, 5) and (234, 209).
; PLAN: r0=236(x1), r1=5(y1), r2=234(x2), r3=209(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 5
LDI r2, 234
LDI r3, 209
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
