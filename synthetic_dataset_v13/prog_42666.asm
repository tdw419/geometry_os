; DESCRIPTION: Composite: Sets a single yellow pixel at (385, 253) then Draws a orange circle centered at (183, 159) with radius 10 then Renders a orange box of size 24x42 starting at (310, 145).
; PLAN: r0=385(x), r1=253(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=159(y), r7=10(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=310(x), r11=145(y), r12=24(width), r13=42(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 253
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 183
LDI r6, 159
LDI r7, 10
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 310
LDI r11, 145
LDI r12, 24
LDI r13, 42
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
