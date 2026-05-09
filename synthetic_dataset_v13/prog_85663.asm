; DESCRIPTION: Renders a white line between points (137, 36) and (18, 65).
; PLAN: r0=137(x1), r1=36(y1), r2=18(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 36
LDI r2, 18
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
