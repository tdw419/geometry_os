; DESCRIPTION: Renders a white line between points (325, 114) and (295, 3).
; PLAN: r0=325(x1), r1=114(y1), r2=295(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 114
LDI r2, 295
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
