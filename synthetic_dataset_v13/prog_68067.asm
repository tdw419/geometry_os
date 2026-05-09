; DESCRIPTION: Renders a white line between points (380, 211) and (486, 154).
; PLAN: r0=380(x1), r1=211(y1), r2=486(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 211
LDI r2, 486
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
