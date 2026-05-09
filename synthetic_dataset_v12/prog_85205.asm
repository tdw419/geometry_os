; DESCRIPTION: Renders a white line between points (487, 190) and (407, 154).
; PLAN: r0=487(x1), r1=190(y1), r2=407(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 190
LDI r2, 407
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
