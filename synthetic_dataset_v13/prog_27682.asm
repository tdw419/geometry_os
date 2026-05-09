; DESCRIPTION: Composite: Creates a black rectangular region at (154, 160) spanning 97 by 91 pixels then Places a blue dot at position (198, 94).
; PLAN: r0=154(x), r1=160(y), r2=97(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=198(x), r6=94(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 154
LDI r1, 160
LDI r2, 97
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 94
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
