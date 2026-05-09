; DESCRIPTION: Composite: Renders a cyan disk with center (157, 18) and radius 16 then Sets a single purple pixel at (140, 63) then Draws a yellow rectangle at (164, 19) with width 55 and height 45.
; PLAN: r0=157(x), r1=18(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=140(x), r6=63(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=164(x), r11=19(y), r12=55(width), r13=45(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 157
LDI r1, 18
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 140
LDI r6, 63
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 164
LDI r11, 19
LDI r12, 55
LDI r13, 45
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
