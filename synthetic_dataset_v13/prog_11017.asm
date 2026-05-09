; DESCRIPTION: Composite: Places a white circle of radius 44 at center (66, 135) then Sets a single magenta pixel at (288, 170).
; PLAN: r0=66(x), r1=135(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=288(x), r6=170(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 66
LDI r1, 135
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 288
LDI r6, 170
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
