; DESCRIPTION: Renders a black line between points (35, 150) and (120, 98).
; PLAN: r0=35(x1), r1=150(y1), r2=120(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 150
LDI r2, 120
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
