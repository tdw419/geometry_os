; DESCRIPTION: Composite: Sets a single magenta pixel at (440, 220) then Creates a red rectangular region at (434, 137) spanning 51 by 90 pixels.
; PLAN: r0=440(x), r1=220(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=434(x), r6=137(y), r7=51(width), r8=90(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 440
LDI r1, 220
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 434
LDI r6, 137
LDI r7, 51
LDI r8, 90
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
