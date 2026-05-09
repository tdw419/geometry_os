; DESCRIPTION: Composite: Sets a single purple pixel at (366, 120) then Draws a cyan circle centered at (265, 129) with radius 69.
; PLAN: r0=366(x), r1=120(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=265(x), r6=129(y), r7=69(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 366
LDI r1, 120
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 265
LDI r6, 129
LDI r7, 69
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
