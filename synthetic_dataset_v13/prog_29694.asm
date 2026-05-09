; DESCRIPTION: Renders a black line between points (341, 168) and (267, 24).
; PLAN: r0=341(x1), r1=168(y1), r2=267(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 168
LDI r2, 267
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
