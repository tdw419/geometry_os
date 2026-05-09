; DESCRIPTION: Places a white line segment connecting (124, 154) to (174, 191).
; PLAN: r0=124(x1), r1=154(y1), r2=174(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 154
LDI r2, 174
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
