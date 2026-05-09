; DESCRIPTION: Composite: Places a cyan 83x96 rectangle at position (27, 13) then Draws a red circle centered at (414, 67) with radius 43 then Places a cyan line segment connecting (480, 105) to (67, 218).
; PLAN: r0=27(x), r1=13(y), r2=83(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=414(x), r6=67(y), r7=43(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=480(x1), r11=105(y1), r12=67(x2), r13=218(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 27
LDI r1, 13
LDI r2, 83
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 67
LDI r7, 43
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 480
LDI r11, 105
LDI r12, 67
LDI r13, 218
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
