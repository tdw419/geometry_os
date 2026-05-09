; DESCRIPTION: Renders a white line between points (103, 212) and (490, 101).
; PLAN: r0=103(x1), r1=212(y1), r2=490(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 212
LDI r2, 490
LDI r3, 101
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
