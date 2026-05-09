; DESCRIPTION: Renders a red line between points (267, 249) and (290, 140).
; PLAN: r0=267(x1), r1=249(y1), r2=290(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 249
LDI r2, 290
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
