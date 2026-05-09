; DESCRIPTION: Renders a blue line between points (465, 116) and (450, 120).
; PLAN: r0=465(x1), r1=116(y1), r2=450(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 116
LDI r2, 450
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
