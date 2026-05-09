; DESCRIPTION: Renders a white line between points (350, 61) and (96, 188).
; PLAN: r0=350(x1), r1=61(y1), r2=96(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 61
LDI r2, 96
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
