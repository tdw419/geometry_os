; DESCRIPTION: Composite: Places a magenta circle of radius 50 at center (284, 143) then Draws a orange rectangle at (203, 16) with width 90 and height 87 then Sets a single white pixel at (211, 86).
; PLAN: r0=284(x), r1=143(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=203(x), r6=16(y), r7=90(width), r8=87(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=211(x), r11=86(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 284
LDI r1, 143
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 203
LDI r6, 16
LDI r7, 90
LDI r8, 87
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 211
LDI r11, 86
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
