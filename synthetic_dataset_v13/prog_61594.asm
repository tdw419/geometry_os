; DESCRIPTION: Composite: Draws a magenta circle centered at (264, 45) with radius 35 then Places a blue line segment connecting (66, 128) to (166, 204) then Places a cyan 61x12 rectangle at position (240, 20).
; PLAN: r0=264(x), r1=45(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=66(x1), r6=128(y1), r7=166(x2), r8=204(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=240(x), r11=20(y), r12=61(width), r13=12(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 264
LDI r1, 45
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 66
LDI r6, 128
LDI r7, 166
LDI r8, 204
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 240
LDI r11, 20
LDI r12, 61
LDI r13, 12
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
