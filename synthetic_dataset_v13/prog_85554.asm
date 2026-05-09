; DESCRIPTION: Composite: Places a black dot at position (376, 133) then Places a cyan 29x104 rectangle at position (180, 94) then Draws a green circle centered at (293, 149) with radius 61.
; PLAN: r0=376(x), r1=133(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=180(x), r6=94(y), r7=29(width), r8=104(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=293(x), r11=149(y), r12=61(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 376
LDI r1, 133
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 180
LDI r6, 94
LDI r7, 29
LDI r8, 104
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 293
LDI r11, 149
LDI r12, 61
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
