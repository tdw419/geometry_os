; DESCRIPTION: Composite: Draws a green rectangle at (418, 162) with width 73 and height 76 then Renders a white line between points (165, 16) and (423, 143) then Renders a yellow disk with center (255, 108) and radius 27.
; PLAN: r0=418(x), r1=162(y), r2=73(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=165(x1), r6=16(y1), r7=423(x2), r8=143(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=255(x), r11=108(y), r12=27(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 418
LDI r1, 162
LDI r2, 73
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 16
LDI r7, 423
LDI r8, 143
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 108
LDI r12, 27
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
