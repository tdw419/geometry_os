; DESCRIPTION: Composite: Draws a purple circle centered at (66, 173) with radius 37 then Draws a magenta line from (459, 213) to (269, 80) then Renders a magenta box of size 32x52 starting at (411, 104).
; PLAN: r0=66(x), r1=173(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=459(x1), r6=213(y1), r7=269(x2), r8=80(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=411(x), r11=104(y), r12=32(width), r13=52(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 66
LDI r1, 173
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 459
LDI r6, 213
LDI r7, 269
LDI r8, 80
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 411
LDI r11, 104
LDI r12, 32
LDI r13, 52
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
