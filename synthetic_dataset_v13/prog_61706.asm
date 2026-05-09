; DESCRIPTION: Renders a orange line between points (362, 25) and (394, 109).
; PLAN: r0=362(x1), r1=25(y1), r2=394(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 25
LDI r2, 394
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
