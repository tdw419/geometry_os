; DESCRIPTION: Renders a green line between points (198, 22) and (48, 100).
; PLAN: r0=198(x1), r1=22(y1), r2=48(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 22
LDI r2, 48
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
