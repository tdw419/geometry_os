; DESCRIPTION: Composite: Places a magenta line segment connecting (144, 93) to (208, 174) then Draws a red circle centered at (143, 152) with radius 77 then Sets a single orange pixel at (481, 201).
; PLAN: r0=144(x1), r1=93(y1), r2=208(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=143(x), r6=152(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=481(x), r11=201(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 144
LDI r1, 93
LDI r2, 208
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 152
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 481
LDI r11, 201
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
