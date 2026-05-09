; DESCRIPTION: Composite: Places a cyan circle of radius 51 at center (56, 172) then Creates a white rectangular region at (95, 103) spanning 77 by 77 pixels then Draws a black line from (495, 21) to (224, 138).
; PLAN: r0=56(x), r1=172(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=95(x), r6=103(y), r7=77(width), r8=77(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=495(x1), r11=21(y1), r12=224(x2), r13=138(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 56
LDI r1, 172
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 95
LDI r6, 103
LDI r7, 77
LDI r8, 77
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 495
LDI r11, 21
LDI r12, 224
LDI r13, 138
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
