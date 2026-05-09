; DESCRIPTION: Composite: Draws a white rectangle at (71, 152) with width 52 and height 59 then Sets a single magenta pixel at (449, 1) then Places a white circle of radius 40 at center (282, 137).
; PLAN: r0=71(x), r1=152(y), r2=52(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=449(x), r6=1(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=282(x), r11=137(y), r12=40(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 71
LDI r1, 152
LDI r2, 52
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 1
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 282
LDI r11, 137
LDI r12, 40
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
