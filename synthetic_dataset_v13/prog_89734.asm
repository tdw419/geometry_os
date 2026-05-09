; DESCRIPTION: Renders a green line between points (120, 150) and (303, 254).
; PLAN: r0=120(x1), r1=150(y1), r2=303(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 150
LDI r2, 303
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
