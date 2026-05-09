; DESCRIPTION: Renders a white line between points (154, 18) and (56, 211).
; PLAN: r0=154(x1), r1=18(y1), r2=56(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 18
LDI r2, 56
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
