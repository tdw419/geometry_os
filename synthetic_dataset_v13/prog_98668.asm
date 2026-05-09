; DESCRIPTION: Renders a red line between points (330, 132) and (308, 110).
; PLAN: r0=330(x1), r1=132(y1), r2=308(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 132
LDI r2, 308
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
