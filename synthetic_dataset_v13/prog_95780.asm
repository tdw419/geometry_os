; DESCRIPTION: Renders a red line between points (452, 172) and (464, 67).
; PLAN: r0=452(x1), r1=172(y1), r2=464(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 172
LDI r2, 464
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
