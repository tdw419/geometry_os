; DESCRIPTION: Composite: Draws a red rectangle at (123, 59) with width 119 and height 16 then Places a white line segment connecting (206, 255) to (190, 31) then Places a cyan circle of radius 52 at center (105, 74).
; PLAN: r0=123(x), r1=59(y), r2=119(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=206(x1), r6=255(y1), r7=190(x2), r8=31(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=105(x), r11=74(y), r12=52(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 123
LDI r1, 59
LDI r2, 119
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 255
LDI r7, 190
LDI r8, 31
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 105
LDI r11, 74
LDI r12, 52
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
