; DESCRIPTION: Renders a black line between points (75, 243) and (147, 228).
; PLAN: r0=75(x1), r1=243(y1), r2=147(x2), r3=228(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 243
LDI r2, 147
LDI r3, 228
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
