; DESCRIPTION: Composite: Sets a single green pixel at (55, 51) then Places a white 26x97 rectangle at position (229, 24) then Renders a blue disk with center (425, 177) and radius 78.
; PLAN: r0=55(x), r1=51(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=229(x), r6=24(y), r7=26(width), r8=97(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=425(x), r11=177(y), r12=78(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 55
LDI r1, 51
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 229
LDI r6, 24
LDI r7, 26
LDI r8, 97
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 425
LDI r11, 177
LDI r12, 78
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
