; DESCRIPTION: Renders a red line between points (464, 99) and (443, 14).
; PLAN: r0=464(x1), r1=99(y1), r2=443(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 99
LDI r2, 443
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
