; DESCRIPTION: Renders a black line between points (104, 12) and (280, 74).
; PLAN: r0=104(x1), r1=12(y1), r2=280(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 12
LDI r2, 280
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
