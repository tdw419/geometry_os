; DESCRIPTION: Composite: Sets a single magenta pixel at (401, 217) then Draws a purple circle centered at (405, 176) with radius 15 then Renders a red line between points (251, 87) and (230, 82).
; PLAN: r0=401(x), r1=217(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=405(x), r6=176(y), r7=15(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=251(x1), r11=87(y1), r12=230(x2), r13=82(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 401
LDI r1, 217
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 405
LDI r6, 176
LDI r7, 15
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 251
LDI r11, 87
LDI r12, 230
LDI r13, 82
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
