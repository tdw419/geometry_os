; DESCRIPTION: Composite: Places a orange circle of radius 67 at center (264, 188) then Sets a single magenta pixel at (70, 240).
; PLAN: r0=264(x), r1=188(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=70(x), r6=240(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 264
LDI r1, 188
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 70
LDI r6, 240
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
