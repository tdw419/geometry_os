; DESCRIPTION: Composite: Draws a orange rectangle at (94, 47) with width 31 and height 38 then Sets a single orange pixel at (92, 86) then Renders a white disk with center (127, 193) and radius 32.
; PLAN: r0=94(x), r1=47(y), r2=31(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=92(x), r6=86(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=127(x), r11=193(y), r12=32(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 94
LDI r1, 47
LDI r2, 31
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 86
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 127
LDI r11, 193
LDI r12, 32
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
