; DESCRIPTION: Composite: Places a magenta circle of radius 39 at center (425, 83) then Creates a orange rectangular region at (482, 18) spanning 27 by 117 pixels then Sets a single magenta pixel at (491, 159).
; PLAN: r0=425(x), r1=83(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=482(x), r6=18(y), r7=27(width), r8=117(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=491(x), r11=159(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 425
LDI r1, 83
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 482
LDI r6, 18
LDI r7, 27
LDI r8, 117
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 491
LDI r11, 159
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
