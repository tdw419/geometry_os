; DESCRIPTION: Renders a green line between points (63, 175) and (174, 148).
; PLAN: r0=63(x1), r1=175(y1), r2=174(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 175
LDI r2, 174
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
