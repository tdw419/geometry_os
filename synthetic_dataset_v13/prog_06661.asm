; DESCRIPTION: Composite: Sets a single magenta pixel at (312, 197) then Creates a green rectangular region at (338, 115) spanning 25 by 63 pixels.
; PLAN: r0=312(x), r1=197(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=338(x), r6=115(y), r7=25(width), r8=63(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 312
LDI r1, 197
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 338
LDI r6, 115
LDI r7, 25
LDI r8, 63
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
