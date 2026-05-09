; DESCRIPTION: Composite: Places a yellow circle of radius 57 at center (264, 107) then Draws a orange rectangle at (328, 173) with width 91 and height 33 then Renders a yellow line between points (228, 224) and (435, 55).
; PLAN: r0=264(x), r1=107(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=328(x), r6=173(y), r7=91(width), r8=33(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=228(x1), r11=224(y1), r12=435(x2), r13=55(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 264
LDI r1, 107
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 328
LDI r6, 173
LDI r7, 91
LDI r8, 33
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 228
LDI r11, 224
LDI r12, 435
LDI r13, 55
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
