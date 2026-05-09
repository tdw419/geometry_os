; DESCRIPTION: Composite: Places a white circle of radius 49 at center (281, 97) then Sets a single white pixel at (510, 74).
; PLAN: r0=281(x), r1=97(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=510(x), r6=74(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 281
LDI r1, 97
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 510
LDI r6, 74
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
