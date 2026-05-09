; DESCRIPTION: Composite: Creates a black rectangular region at (27, 111) spanning 57 by 11 pixels then Creates a magenta circular shape at (164, 106) with radius 56 then Places a green line segment connecting (146, 31) to (297, 199).
; PLAN: r0=27(x), r1=111(y), r2=57(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=164(x), r6=106(y), r7=56(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=146(x1), r11=31(y1), r12=297(x2), r13=199(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 27
LDI r1, 111
LDI r2, 57
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 106
LDI r7, 56
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 146
LDI r11, 31
LDI r12, 297
LDI r13, 199
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
