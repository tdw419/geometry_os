; DESCRIPTION: Renders a green line between points (267, 41) and (249, 208).
; PLAN: r0=267(x1), r1=41(y1), r2=249(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 41
LDI r2, 249
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
