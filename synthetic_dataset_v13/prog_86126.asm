; DESCRIPTION: Renders a yellow line between points (391, 247) and (23, 174).
; PLAN: r0=391(x1), r1=247(y1), r2=23(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 247
LDI r2, 23
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
