; DESCRIPTION: Composite: Places a cyan dot at position (360, 190) then Places a blue 27x113 rectangle at position (449, 97) then Draws a yellow circle centered at (418, 147) with radius 11.
; PLAN: r0=360(x), r1=190(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=449(x), r6=97(y), r7=27(width), r8=113(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=418(x), r11=147(y), r12=11(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 360
LDI r1, 190
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 449
LDI r6, 97
LDI r7, 27
LDI r8, 113
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 418
LDI r11, 147
LDI r12, 11
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
