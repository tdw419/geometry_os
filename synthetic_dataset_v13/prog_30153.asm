; DESCRIPTION: Composite: Draws a cyan circle centered at (145, 112) with radius 10 then Places a cyan 41x56 rectangle at position (4, 104) then Sets a single purple pixel at (341, 204).
; PLAN: r0=145(x), r1=112(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=4(x), r6=104(y), r7=41(width), r8=56(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=341(x), r11=204(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 145
LDI r1, 112
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 4
LDI r6, 104
LDI r7, 41
LDI r8, 56
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 204
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
