; DESCRIPTION: Renders a green line between points (270, 174) and (40, 174).
; PLAN: r0=270(x1), r1=174(y1), r2=40(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 174
LDI r2, 40
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
