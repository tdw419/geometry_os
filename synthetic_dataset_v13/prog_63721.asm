; DESCRIPTION: Composite: Places a green dot at position (488, 214) then Draws a magenta circle centered at (224, 172) with radius 75.
; PLAN: r0=488(x), r1=214(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=224(x), r6=172(y), r7=75(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 488
LDI r1, 214
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 224
LDI r6, 172
LDI r7, 75
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
