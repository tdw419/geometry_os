; DESCRIPTION: Composite: Sets a single purple pixel at (265, 192) then Places a white 111x56 rectangle at position (56, 27) then Places a white circle of radius 12 at center (188, 87).
; PLAN: r0=265(x), r1=192(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=56(x), r6=27(y), r7=111(width), r8=56(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=188(x), r11=87(y), r12=12(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 265
LDI r1, 192
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 56
LDI r6, 27
LDI r7, 111
LDI r8, 56
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 87
LDI r12, 12
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
