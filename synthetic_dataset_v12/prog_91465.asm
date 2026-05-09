; DESCRIPTION: Composite: Places a orange circle of radius 79 at center (271, 177) then Draws a orange rectangle at (154, 104) with width 74 and height 42 then Renders a white line between points (66, 94) and (24, 173).
; PLAN: r0=271(x), r1=177(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=154(x), r6=104(y), r7=74(width), r8=42(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=66(x1), r11=94(y1), r12=24(x2), r13=173(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 271
LDI r1, 177
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 154
LDI r6, 104
LDI r7, 74
LDI r8, 42
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 66
LDI r11, 94
LDI r12, 24
LDI r13, 173
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
