; DESCRIPTION: Composite: Places a blue circle of radius 56 at center (123, 78) then Sets a single purple pixel at (162, 213).
; PLAN: r0=123(x), r1=78(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=162(x), r6=213(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 123
LDI r1, 78
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 162
LDI r6, 213
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
