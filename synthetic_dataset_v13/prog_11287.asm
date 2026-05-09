; DESCRIPTION: Renders a red line between points (63, 114) and (480, 230).
; PLAN: r0=63(x1), r1=114(y1), r2=480(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 114
LDI r2, 480
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
