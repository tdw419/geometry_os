; DESCRIPTION: Composite: Places a yellow 45x104 rectangle at position (23, 0) then Sets a single purple pixel at (415, 240).
; PLAN: r0=23(x), r1=0(y), r2=45(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=415(x), r6=240(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 23
LDI r1, 0
LDI r2, 45
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 240
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
