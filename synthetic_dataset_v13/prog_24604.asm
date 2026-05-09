; DESCRIPTION: Renders a red line between points (166, 3) and (400, 103).
; PLAN: r0=166(x1), r1=3(y1), r2=400(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 3
LDI r2, 400
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
