; DESCRIPTION: Composite: Places a magenta dot at position (169, 245) then Places a white line segment connecting (406, 67) to (304, 185) then Draws a white circle centered at (228, 181) with radius 25.
; PLAN: r0=169(x), r1=245(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=406(x1), r6=67(y1), r7=304(x2), r8=185(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=228(x), r11=181(y), r12=25(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 169
LDI r1, 245
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 406
LDI r6, 67
LDI r7, 304
LDI r8, 185
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 228
LDI r11, 181
LDI r12, 25
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
