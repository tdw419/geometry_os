; DESCRIPTION: Renders a orange line between points (368, 220) and (104, 8).
; PLAN: r0=368(x1), r1=220(y1), r2=104(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 220
LDI r2, 104
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
