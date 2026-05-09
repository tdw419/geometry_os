; DESCRIPTION: Renders a orange line between points (156, 164) and (338, 207).
; PLAN: r0=156(x1), r1=164(y1), r2=338(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 164
LDI r2, 338
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
