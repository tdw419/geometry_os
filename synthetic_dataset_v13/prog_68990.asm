; DESCRIPTION: Renders a red line between points (359, 28) and (254, 207).
; PLAN: r0=359(x1), r1=28(y1), r2=254(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 28
LDI r2, 254
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
