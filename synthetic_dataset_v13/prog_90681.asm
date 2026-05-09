; DESCRIPTION: Composite: Places a yellow circle of radius 42 at center (368, 98) then Draws a blue rectangle at (207, 127) with width 60 and height 52 then Places a orange dot at position (425, 163).
; PLAN: r0=368(x), r1=98(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=207(x), r6=127(y), r7=60(width), r8=52(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=425(x), r11=163(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 368
LDI r1, 98
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 207
LDI r6, 127
LDI r7, 60
LDI r8, 52
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 425
LDI r11, 163
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
