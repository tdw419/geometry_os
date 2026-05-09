; DESCRIPTION: Renders a white line between points (202, 119) and (275, 154).
; PLAN: r0=202(x1), r1=119(y1), r2=275(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 119
LDI r2, 275
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
