; DESCRIPTION: Composite: Creates a blue rectangular region at (91, 127) spanning 17 by 104 pixels then Places a orange dot at position (435, 38).
; PLAN: r0=91(x), r1=127(y), r2=17(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=435(x), r6=38(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 91
LDI r1, 127
LDI r2, 17
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 38
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
