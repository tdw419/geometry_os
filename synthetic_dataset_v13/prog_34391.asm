; DESCRIPTION: Composite: Places a white circle of radius 67 at center (224, 113) then Sets a single orange pixel at (70, 190).
; PLAN: r0=224(x), r1=113(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=70(x), r6=190(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 224
LDI r1, 113
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 70
LDI r6, 190
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
