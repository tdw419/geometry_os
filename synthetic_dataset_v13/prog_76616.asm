; DESCRIPTION: Composite: Creates a cyan rectangular region at (284, 162) spanning 58 by 50 pixels then Draws a magenta circle centered at (237, 112) with radius 71 then Places a magenta line segment connecting (31, 138) to (417, 201).
; PLAN: r0=284(x), r1=162(y), r2=58(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=237(x), r6=112(y), r7=71(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=31(x1), r11=138(y1), r12=417(x2), r13=201(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 162
LDI r2, 58
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 112
LDI r7, 71
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 31
LDI r11, 138
LDI r12, 417
LDI r13, 201
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
