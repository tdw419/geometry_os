; DESCRIPTION: Composite: Draws a orange rectangle at (304, 156) with width 114 and height 48 then Sets a single white pixel at (386, 230) then Renders a green line between points (5, 239) and (482, 218).
; PLAN: r0=304(x), r1=156(y), r2=114(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=386(x), r6=230(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=5(x1), r11=239(y1), r12=482(x2), r13=218(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 304
LDI r1, 156
LDI r2, 114
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 230
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 5
LDI r11, 239
LDI r12, 482
LDI r13, 218
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
