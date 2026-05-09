; DESCRIPTION: Composite: Creates a cyan circular shape at (378, 25) with radius 20 then Places a blue 22x56 rectangle at position (385, 144) then Places a blue dot at position (452, 87).
; PLAN: r0=378(x), r1=25(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x), r6=144(y), r7=22(width), r8=56(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=452(x), r11=87(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 378
LDI r1, 25
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 144
LDI r7, 22
LDI r8, 56
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 452
LDI r11, 87
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
