; DESCRIPTION: Composite: Places a red circle of radius 79 at center (307, 155) then Draws a magenta rectangle at (5, 98) with width 109 and height 40 then Sets a single orange pixel at (260, 13).
; PLAN: r0=307(x), r1=155(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=5(x), r6=98(y), r7=109(width), r8=40(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=260(x), r11=13(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 307
LDI r1, 155
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 5
LDI r6, 98
LDI r7, 109
LDI r8, 40
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 260
LDI r11, 13
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
