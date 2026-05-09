; DESCRIPTION: Composite: Draws a black rectangle at (297, 22) with width 72 and height 20 then Places a blue circle of radius 17 at center (273, 96) then Places a black dot at position (410, 22).
; PLAN: r0=297(x), r1=22(y), r2=72(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=273(x), r6=96(y), r7=17(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=410(x), r11=22(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 297
LDI r1, 22
LDI r2, 72
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 96
LDI r7, 17
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 410
LDI r11, 22
LDI r12, 0x000000
PSET r10, r11, r12
HALT
