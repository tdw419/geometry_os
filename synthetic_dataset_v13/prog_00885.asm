; DESCRIPTION: Renders a white line between points (132, 230) and (250, 167).
; PLAN: r0=132(x1), r1=230(y1), r2=250(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 230
LDI r2, 250
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
