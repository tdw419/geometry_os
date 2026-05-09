; DESCRIPTION: Composite: Draws a orange rectangle at (4, 116) with width 17 and height 91 then Places a blue dot at position (468, 154).
; PLAN: r0=4(x), r1=116(y), r2=17(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=468(x), r6=154(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 4
LDI r1, 116
LDI r2, 17
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 154
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
