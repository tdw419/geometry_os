; DESCRIPTION: Composite: Sets a single blue pixel at (370, 45) then Renders a blue line between points (193, 92) and (188, 147).
; PLAN: r0=370(x), r1=45(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=193(x1), r6=92(y1), r7=188(x2), r8=147(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 370
LDI r1, 45
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 193
LDI r6, 92
LDI r7, 188
LDI r8, 147
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
