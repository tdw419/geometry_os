; DESCRIPTION: Places a white line segment connecting (166, 193) to (454, 154).
; PLAN: r0=166(x1), r1=193(y1), r2=454(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 193
LDI r2, 454
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
