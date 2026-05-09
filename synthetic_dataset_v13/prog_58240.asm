; DESCRIPTION: Renders a blue line between points (166, 165) and (85, 164).
; PLAN: r0=166(x1), r1=165(y1), r2=85(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 165
LDI r2, 85
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
