; DESCRIPTION: Composite: Sets a single orange pixel at (281, 166) then Draws a red circle centered at (442, 168) with radius 70.
; PLAN: r0=281(x), r1=166(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=442(x), r6=168(y), r7=70(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 281
LDI r1, 166
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 442
LDI r6, 168
LDI r7, 70
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
