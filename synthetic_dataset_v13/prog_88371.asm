; DESCRIPTION: Composite: Places a yellow dot at position (70, 118) then Draws a green circle centered at (164, 209) with radius 40 then Creates a yellow rectangular region at (169, 131) spanning 44 by 28 pixels.
; PLAN: r0=70(x), r1=118(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=164(x), r6=209(y), r7=40(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=169(x), r11=131(y), r12=44(width), r13=28(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 70
LDI r1, 118
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 164
LDI r6, 209
LDI r7, 40
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 169
LDI r11, 131
LDI r12, 44
LDI r13, 28
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
