; DESCRIPTION: Renders a black line between points (201, 228) and (464, 142).
; PLAN: r0=201(x1), r1=228(y1), r2=464(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 228
LDI r2, 464
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
