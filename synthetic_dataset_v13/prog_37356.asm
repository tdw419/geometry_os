; DESCRIPTION: Renders a white line between points (339, 153) and (505, 220).
; PLAN: r0=339(x1), r1=153(y1), r2=505(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 153
LDI r2, 505
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
