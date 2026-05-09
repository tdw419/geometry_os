; DESCRIPTION: Composite: Draws a orange rectangle at (107, 45) with width 33 and height 19 then Places a cyan circle of radius 47 at center (436, 72).
; PLAN: r0=107(x), r1=45(y), r2=33(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=436(x), r6=72(y), r7=47(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 107
LDI r1, 45
LDI r2, 33
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 72
LDI r7, 47
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
