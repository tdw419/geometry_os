; DESCRIPTION: Composite: Creates a blue circular shape at (328, 131) with radius 39 then Draws a blue line from (224, 205) to (374, 35) then Places a green 91x55 rectangle at position (308, 9).
; PLAN: r0=328(x), r1=131(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=224(x1), r6=205(y1), r7=374(x2), r8=35(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=308(x), r11=9(y), r12=91(width), r13=55(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 328
LDI r1, 131
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 224
LDI r6, 205
LDI r7, 374
LDI r8, 35
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 9
LDI r12, 91
LDI r13, 55
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
