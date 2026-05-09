; DESCRIPTION: Renders a white line between points (135, 59) and (251, 154).
; PLAN: r0=135(x1), r1=59(y1), r2=251(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 59
LDI r2, 251
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
