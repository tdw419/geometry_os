; DESCRIPTION: Renders a blue line between points (346, 30) and (116, 105).
; PLAN: r0=346(x1), r1=30(y1), r2=116(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 30
LDI r2, 116
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
