; DESCRIPTION: Composite: Sets a single orange pixel at (415, 224) then Renders a magenta line between points (211, 99) and (476, 124).
; PLAN: r0=415(x), r1=224(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=211(x1), r6=99(y1), r7=476(x2), r8=124(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 415
LDI r1, 224
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 211
LDI r6, 99
LDI r7, 476
LDI r8, 124
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
