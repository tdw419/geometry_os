; DESCRIPTION: Renders a orange line between points (289, 244) and (29, 154).
; PLAN: r0=289(x1), r1=244(y1), r2=29(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 244
LDI r2, 29
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
