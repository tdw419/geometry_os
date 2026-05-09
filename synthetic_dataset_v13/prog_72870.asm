; DESCRIPTION: Composite: Places a magenta circle of radius 79 at center (182, 80) then Draws a purple rectangle at (72, 50) with width 19 and height 105 then Sets a single purple pixel at (353, 215).
; PLAN: r0=182(x), r1=80(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=72(x), r6=50(y), r7=19(width), r8=105(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=353(x), r11=215(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 182
LDI r1, 80
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 72
LDI r6, 50
LDI r7, 19
LDI r8, 105
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 215
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
