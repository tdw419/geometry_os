; DESCRIPTION: Composite: Draws a orange rectangle at (454, 1) with width 55 and height 21 then Sets a single black pixel at (202, 100).
; PLAN: r0=454(x), r1=1(y), r2=55(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=202(x), r6=100(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 454
LDI r1, 1
LDI r2, 55
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 100
LDI r7, 0x000000
PSET r5, r6, r7
HALT
