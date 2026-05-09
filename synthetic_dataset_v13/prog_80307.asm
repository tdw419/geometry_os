; DESCRIPTION: Renders a white line between points (174, 12) and (264, 36).
; PLAN: r0=174(x1), r1=12(y1), r2=264(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 12
LDI r2, 264
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
