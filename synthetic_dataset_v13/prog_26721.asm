; DESCRIPTION: Renders a magenta line between points (380, 147) and (425, 2).
; PLAN: r0=380(x1), r1=147(y1), r2=425(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 147
LDI r2, 425
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
