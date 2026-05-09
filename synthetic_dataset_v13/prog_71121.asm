; DESCRIPTION: Composite: Creates a green circular shape at (135, 107) with radius 65 then Renders a black line between points (494, 111) and (325, 7) then Renders a red box of size 26x69 starting at (100, 57).
; PLAN: r0=135(x), r1=107(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=494(x1), r6=111(y1), r7=325(x2), r8=7(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=100(x), r11=57(y), r12=26(width), r13=69(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 135
LDI r1, 107
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 494
LDI r6, 111
LDI r7, 325
LDI r8, 7
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 100
LDI r11, 57
LDI r12, 26
LDI r13, 69
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
