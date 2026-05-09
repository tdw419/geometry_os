; DESCRIPTION: Composite: Draws a cyan rectangle at (135, 120) with width 38 and height 100 then Sets a single green pixel at (447, 183) then Places a yellow circle of radius 13 at center (328, 209).
; PLAN: r0=135(x), r1=120(y), r2=38(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=447(x), r6=183(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=328(x), r11=209(y), r12=13(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 135
LDI r1, 120
LDI r2, 38
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 183
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 328
LDI r11, 209
LDI r12, 13
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
