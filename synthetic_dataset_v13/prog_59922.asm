; DESCRIPTION: Renders a white line between points (135, 208) and (500, 175).
; PLAN: r0=135(x1), r1=208(y1), r2=500(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 208
LDI r2, 500
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
