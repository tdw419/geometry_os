; DESCRIPTION: Composite: Places a green circle of radius 38 at center (50, 209) then Places a magenta 39x23 rectangle at position (318, 73) then Draws a red line from (488, 249) to (447, 78).
; PLAN: r0=50(x), r1=209(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=318(x), r6=73(y), r7=39(width), r8=23(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=488(x1), r11=249(y1), r12=447(x2), r13=78(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 50
LDI r1, 209
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 318
LDI r6, 73
LDI r7, 39
LDI r8, 23
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 488
LDI r11, 249
LDI r12, 447
LDI r13, 78
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
