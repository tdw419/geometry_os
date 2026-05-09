; DESCRIPTION: Composite: Draws a orange rectangle at (295, 106) with width 63 and height 51 then Places a green circle of radius 53 at center (365, 78).
; PLAN: r0=295(x), r1=106(y), r2=63(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=365(x), r6=78(y), r7=53(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 295
LDI r1, 106
LDI r2, 63
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 78
LDI r7, 53
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
