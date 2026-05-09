; DESCRIPTION: Composite: Sets a single green pixel at (194, 83) then Draws a purple line from (92, 214) to (169, 166).
; PLAN: r0=194(x), r1=83(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=92(x1), r6=214(y1), r7=169(x2), r8=166(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 194
LDI r1, 83
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 92
LDI r6, 214
LDI r7, 169
LDI r8, 166
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
