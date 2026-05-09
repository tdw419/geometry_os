; DESCRIPTION: Renders a white line between points (319, 131) and (486, 65).
; PLAN: r0=319(x1), r1=131(y1), r2=486(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 131
LDI r2, 486
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
