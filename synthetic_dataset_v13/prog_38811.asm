; DESCRIPTION: Composite: Creates a white rectangular region at (262, 45) spanning 37 by 10 pixels then Draws a yellow circle centered at (123, 79) with radius 17.
; PLAN: r0=262(x), r1=45(y), r2=37(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x), r6=79(y), r7=17(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 262
LDI r1, 45
LDI r2, 37
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 79
LDI r7, 17
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
