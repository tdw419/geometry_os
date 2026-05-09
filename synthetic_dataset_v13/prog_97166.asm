; DESCRIPTION: Composite: Draws a orange rectangle at (57, 32) with width 29 and height 110 then Sets a single black pixel at (7, 59).
; PLAN: r0=57(x), r1=32(y), r2=29(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=7(x), r6=59(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 57
LDI r1, 32
LDI r2, 29
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 59
LDI r7, 0x000000
PSET r5, r6, r7
HALT
