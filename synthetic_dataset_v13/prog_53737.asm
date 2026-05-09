; DESCRIPTION: Composite: Sets a single red pixel at (266, 209) then Creates a magenta rectangular region at (336, 175) spanning 65 by 52 pixels.
; PLAN: r0=266(x), r1=209(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=336(x), r6=175(y), r7=65(width), r8=52(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 266
LDI r1, 209
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 336
LDI r6, 175
LDI r7, 65
LDI r8, 52
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
