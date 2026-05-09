; DESCRIPTION: Composite: Sets a single blue pixel at (183, 141) then Places a yellow line segment connecting (104, 154) to (263, 207) then Renders a magenta box of size 45x52 starting at (236, 187).
; PLAN: r0=183(x), r1=141(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=104(x1), r6=154(y1), r7=263(x2), r8=207(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=236(x), r11=187(y), r12=45(width), r13=52(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 183
LDI r1, 141
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 104
LDI r6, 154
LDI r7, 263
LDI r8, 207
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 236
LDI r11, 187
LDI r12, 45
LDI r13, 52
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
