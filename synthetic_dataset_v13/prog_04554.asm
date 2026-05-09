; DESCRIPTION: Renders a blue line between points (233, 162) and (348, 154).
; PLAN: r0=233(x1), r1=162(y1), r2=348(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 162
LDI r2, 348
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
