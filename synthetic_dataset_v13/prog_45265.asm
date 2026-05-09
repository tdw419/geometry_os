; DESCRIPTION: Composite: Renders a black disk with center (244, 210) and radius 32 then Draws a red line from (372, 19) to (111, 113) then Draws a cyan rectangle at (223, 131) with width 87 and height 33.
; PLAN: r0=244(x), r1=210(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=372(x1), r6=19(y1), r7=111(x2), r8=113(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=223(x), r11=131(y), r12=87(width), r13=33(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 244
LDI r1, 210
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 372
LDI r6, 19
LDI r7, 111
LDI r8, 113
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 223
LDI r11, 131
LDI r12, 87
LDI r13, 33
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
