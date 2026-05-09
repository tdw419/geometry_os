; DESCRIPTION: Renders a blue line between points (498, 236) and (376, 86).
; PLAN: r0=498(x1), r1=236(y1), r2=376(x2), r3=86(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 236
LDI r2, 376
LDI r3, 86
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
