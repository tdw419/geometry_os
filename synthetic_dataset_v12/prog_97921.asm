; DESCRIPTION: Renders a green line between points (500, 21) and (162, 220).
; PLAN: r0=500(x1), r1=21(y1), r2=162(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 21
LDI r2, 162
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
