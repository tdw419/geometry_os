; DESCRIPTION: Renders a green line between points (411, 4) and (442, 18).
; PLAN: r0=411(x1), r1=4(y1), r2=442(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 4
LDI r2, 442
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
