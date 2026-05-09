; DESCRIPTION: Composite: Creates a orange rectangular region at (134, 80) spanning 119 by 59 pixels then Sets a single white pixel at (272, 220) then Places a green circle of radius 61 at center (75, 175).
; PLAN: r0=134(x), r1=80(y), r2=119(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=272(x), r6=220(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=75(x), r11=175(y), r12=61(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 134
LDI r1, 80
LDI r2, 119
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 220
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 75
LDI r11, 175
LDI r12, 61
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
