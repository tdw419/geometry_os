; DESCRIPTION: Composite: Places a cyan 33x67 rectangle at position (210, 150) then Renders a yellow disk with center (162, 84) and radius 68 then Places a red line segment connecting (123, 19) to (204, 119).
; PLAN: r0=210(x), r1=150(y), r2=33(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=162(x), r6=84(y), r7=68(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=123(x1), r11=19(y1), r12=204(x2), r13=119(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 150
LDI r2, 33
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 84
LDI r7, 68
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 123
LDI r11, 19
LDI r12, 204
LDI r13, 119
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
