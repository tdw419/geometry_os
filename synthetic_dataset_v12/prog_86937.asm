; DESCRIPTION: Renders a white line between points (189, 28) and (508, 58).
; PLAN: r0=189(x1), r1=28(y1), r2=508(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 28
LDI r2, 508
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
