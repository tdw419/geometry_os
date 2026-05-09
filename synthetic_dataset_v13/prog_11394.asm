; DESCRIPTION: Composite: Sets a single red pixel at (109, 147) then Creates a yellow rectangular region at (216, 59) spanning 10 by 35 pixels.
; PLAN: r0=109(x), r1=147(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=216(x), r6=59(y), r7=10(width), r8=35(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 109
LDI r1, 147
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 216
LDI r6, 59
LDI r7, 10
LDI r8, 35
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
