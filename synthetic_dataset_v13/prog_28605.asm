; DESCRIPTION: Renders a white line between points (260, 63) and (267, 86).
; PLAN: r0=260(x1), r1=63(y1), r2=267(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 63
LDI r2, 267
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
