; DESCRIPTION: Composite: Draws a yellow rectangle at (224, 25) with width 79 and height 101 then Places a orange dot at position (57, 234).
; PLAN: r0=224(x), r1=25(y), r2=79(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=57(x), r6=234(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 224
LDI r1, 25
LDI r2, 79
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 234
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
