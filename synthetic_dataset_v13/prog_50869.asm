; DESCRIPTION: Renders a red line between points (386, 198) and (38, 120).
; PLAN: r0=386(x1), r1=198(y1), r2=38(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 198
LDI r2, 38
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
