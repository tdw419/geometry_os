; DESCRIPTION: Renders a green line between points (5, 146) and (55, 206).
; PLAN: r0=5(x1), r1=146(y1), r2=55(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 146
LDI r2, 55
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
