; DESCRIPTION: Composite: Creates a yellow rectangular region at (49, 204) spanning 98 by 40 pixels then Renders a magenta disk with center (356, 107) and radius 34 then Places a yellow line segment connecting (202, 28) to (436, 30).
; PLAN: r0=49(x), r1=204(y), r2=98(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=356(x), r6=107(y), r7=34(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=202(x1), r11=28(y1), r12=436(x2), r13=30(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 49
LDI r1, 204
LDI r2, 98
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 107
LDI r7, 34
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 202
LDI r11, 28
LDI r12, 436
LDI r13, 30
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
