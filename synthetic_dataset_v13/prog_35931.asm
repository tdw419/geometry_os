; DESCRIPTION: Composite: Draws a red circle centered at (228, 213) with radius 31 then Creates a magenta rectangular region at (383, 107) spanning 99 by 39 pixels then Places a purple line segment connecting (423, 59) to (509, 191).
; PLAN: r0=228(x), r1=213(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=383(x), r6=107(y), r7=99(width), r8=39(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=423(x1), r11=59(y1), r12=509(x2), r13=191(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 228
LDI r1, 213
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 383
LDI r6, 107
LDI r7, 99
LDI r8, 39
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 423
LDI r11, 59
LDI r12, 509
LDI r13, 191
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
