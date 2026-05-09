; DESCRIPTION: Renders a yellow line between points (250, 12) and (60, 174).
; PLAN: r0=250(x1), r1=12(y1), r2=60(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 12
LDI r2, 60
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
