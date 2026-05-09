; DESCRIPTION: Renders a red line between points (75, 103) and (354, 155).
; PLAN: r0=75(x1), r1=103(y1), r2=354(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 103
LDI r2, 354
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
