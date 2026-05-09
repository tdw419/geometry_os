; DESCRIPTION: Composite: Places a white circle of radius 25 at center (270, 204) then Places a purple line segment connecting (188, 44) to (339, 52) then Places a green 31x36 rectangle at position (146, 113).
; PLAN: r0=270(x), r1=204(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=188(x1), r6=44(y1), r7=339(x2), r8=52(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=146(x), r11=113(y), r12=31(width), r13=36(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 204
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 188
LDI r6, 44
LDI r7, 339
LDI r8, 52
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 146
LDI r11, 113
LDI r12, 31
LDI r13, 36
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
