; DESCRIPTION: Composite: Renders a magenta line between points (328, 168) and (56, 114) then Sets a single white pixel at (433, 169).
; PLAN: r0=328(x1), r1=168(y1), r2=56(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=433(x), r6=169(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 328
LDI r1, 168
LDI r2, 56
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 169
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
