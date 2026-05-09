; DESCRIPTION: Composite: Renders a cyan disk with center (481, 111) and radius 14 then Sets a single green pixel at (350, 187) then Draws a blue rectangle at (88, 58) with width 98 and height 58.
; PLAN: r0=481(x), r1=111(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x), r6=187(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=88(x), r11=58(y), r12=98(width), r13=58(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 481
LDI r1, 111
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 187
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 88
LDI r11, 58
LDI r12, 98
LDI r13, 58
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
