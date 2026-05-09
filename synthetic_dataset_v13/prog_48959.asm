; DESCRIPTION: Composite: Places a yellow circle of radius 61 at center (163, 112) then Draws a cyan rectangle at (97, 126) with width 61 and height 17 then Sets a single purple pixel at (277, 144).
; PLAN: r0=163(x), r1=112(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=97(x), r6=126(y), r7=61(width), r8=17(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=277(x), r11=144(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 163
LDI r1, 112
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 97
LDI r6, 126
LDI r7, 61
LDI r8, 17
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 277
LDI r11, 144
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
