; DESCRIPTION: Composite: Places a red circle of radius 40 at center (353, 58) then Places a cyan line segment connecting (140, 66) to (327, 177) then Creates a magenta rectangular region at (63, 138) spanning 56 by 29 pixels.
; PLAN: r0=353(x), r1=58(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=140(x1), r6=66(y1), r7=327(x2), r8=177(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=63(x), r11=138(y), r12=56(width), r13=29(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 353
LDI r1, 58
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 140
LDI r6, 66
LDI r7, 327
LDI r8, 177
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 63
LDI r11, 138
LDI r12, 56
LDI r13, 29
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
