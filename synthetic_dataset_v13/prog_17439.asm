; DESCRIPTION: Composite: Sets a single purple pixel at (173, 220) then Places a blue circle of radius 44 at center (465, 108).
; PLAN: r0=173(x), r1=220(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=465(x), r6=108(y), r7=44(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 173
LDI r1, 220
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 465
LDI r6, 108
LDI r7, 44
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
