; DESCRIPTION: Composite: Creates a white circular shape at (366, 70) with radius 60 then Sets a single purple pixel at (65, 154).
; PLAN: r0=366(x), r1=70(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=65(x), r6=154(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 366
LDI r1, 70
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 65
LDI r6, 154
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
