; DESCRIPTION: Renders a green line between points (369, 134) and (510, 220).
; PLAN: r0=369(x1), r1=134(y1), r2=510(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 134
LDI r2, 510
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
