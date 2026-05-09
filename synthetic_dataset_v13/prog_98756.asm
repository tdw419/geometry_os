; DESCRIPTION: Composite: Sets a single white pixel at (319, 238) then Places a magenta line segment connecting (330, 11) to (476, 58) then Renders a white box of size 56x90 starting at (50, 108).
; PLAN: r0=319(x), r1=238(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=330(x1), r6=11(y1), r7=476(x2), r8=58(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=50(x), r11=108(y), r12=56(width), r13=90(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 319
LDI r1, 238
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 330
LDI r6, 11
LDI r7, 476
LDI r8, 58
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 50
LDI r11, 108
LDI r12, 56
LDI r13, 90
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
