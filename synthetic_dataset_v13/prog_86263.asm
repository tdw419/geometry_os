; DESCRIPTION: Composite: Sets a single orange pixel at (91, 220) then Draws a magenta circle centered at (30, 33) with radius 24.
; PLAN: r0=91(x), r1=220(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=30(x), r6=33(y), r7=24(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 91
LDI r1, 220
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 30
LDI r6, 33
LDI r7, 24
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
