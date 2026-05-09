; DESCRIPTION: Composite: Sets a single cyan pixel at (334, 66) then Draws a cyan rectangle at (64, 103) with width 90 and height 10 then Draws a blue circle centered at (408, 57) with radius 52.
; PLAN: r0=334(x), r1=66(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=64(x), r6=103(y), r7=90(width), r8=10(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=408(x), r11=57(y), r12=52(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 334
LDI r1, 66
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 64
LDI r6, 103
LDI r7, 90
LDI r8, 10
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 57
LDI r12, 52
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
