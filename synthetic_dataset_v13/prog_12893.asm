; DESCRIPTION: Renders a blue line between points (49, 96) and (465, 60).
; PLAN: r0=49(x1), r1=96(y1), r2=465(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 96
LDI r2, 465
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
