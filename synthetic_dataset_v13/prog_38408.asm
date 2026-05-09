; DESCRIPTION: Composite: Sets a single orange pixel at (392, 203) then Draws a red circle centered at (385, 146) with radius 68.
; PLAN: r0=392(x), r1=203(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=385(x), r6=146(y), r7=68(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 392
LDI r1, 203
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 385
LDI r6, 146
LDI r7, 68
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
