; DESCRIPTION: Composite: Renders a white disk with center (102, 30) and radius 18 then Sets a single cyan pixel at (314, 111) then Draws a purple rectangle at (204, 127) with width 50 and height 103.
; PLAN: r0=102(x), r1=30(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=314(x), r6=111(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=204(x), r11=127(y), r12=50(width), r13=103(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 102
LDI r1, 30
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 314
LDI r6, 111
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 204
LDI r11, 127
LDI r12, 50
LDI r13, 103
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
