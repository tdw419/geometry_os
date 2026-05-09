; DESCRIPTION: Renders a red line between points (26, 48) and (198, 175).
; PLAN: r0=26(x1), r1=48(y1), r2=198(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 48
LDI r2, 198
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
