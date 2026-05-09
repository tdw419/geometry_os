; DESCRIPTION: Renders a white line between points (63, 174) and (450, 247).
; PLAN: r0=63(x1), r1=174(y1), r2=450(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 174
LDI r2, 450
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
