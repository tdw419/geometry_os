; DESCRIPTION: Composite: Renders a red disk with center (205, 32) and radius 12 then Places a red 73x20 rectangle at position (409, 84) then Places a red line segment connecting (292, 245) to (232, 188).
; PLAN: r0=205(x), r1=32(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x), r6=84(y), r7=73(width), r8=20(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=292(x1), r11=245(y1), r12=232(x2), r13=188(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 32
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 84
LDI r7, 73
LDI r8, 20
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 292
LDI r11, 245
LDI r12, 232
LDI r13, 188
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
