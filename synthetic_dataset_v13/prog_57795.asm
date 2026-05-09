; DESCRIPTION: Renders a orange line between points (71, 25) and (48, 154).
; PLAN: r0=71(x1), r1=25(y1), r2=48(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 25
LDI r2, 48
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
