; DESCRIPTION: Composite: Draws a blue rectangle at (405, 107) with width 85 and height 65 then Places a orange dot at position (380, 91) then Draws a yellow line from (86, 151) to (197, 81).
; PLAN: r0=405(x), r1=107(y), r2=85(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=380(x), r6=91(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=86(x1), r11=151(y1), r12=197(x2), r13=81(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 405
LDI r1, 107
LDI r2, 85
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 91
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 86
LDI r11, 151
LDI r12, 197
LDI r13, 81
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
