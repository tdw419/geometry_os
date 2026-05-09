; DESCRIPTION: Composite: Places a white circle of radius 73 at center (429, 174) then Draws a blue rectangle at (27, 4) with width 67 and height 47 then Sets a single purple pixel at (126, 94).
; PLAN: r0=429(x), r1=174(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=27(x), r6=4(y), r7=67(width), r8=47(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=126(x), r11=94(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 429
LDI r1, 174
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 27
LDI r6, 4
LDI r7, 67
LDI r8, 47
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 126
LDI r11, 94
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
