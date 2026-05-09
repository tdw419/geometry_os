; DESCRIPTION: Composite: Sets a single magenta pixel at (362, 52) then Creates a blue rectangular region at (222, 44) spanning 85 by 31 pixels.
; PLAN: r0=362(x), r1=52(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=222(x), r6=44(y), r7=85(width), r8=31(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 362
LDI r1, 52
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 222
LDI r6, 44
LDI r7, 85
LDI r8, 31
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
