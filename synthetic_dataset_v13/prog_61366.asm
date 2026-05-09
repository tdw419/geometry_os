; DESCRIPTION: Composite: Sets a single yellow pixel at (247, 204) then Creates a black rectangular region at (359, 130) spanning 69 by 16 pixels then Places a white line segment connecting (321, 214) to (173, 226).
; PLAN: r0=247(x), r1=204(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=359(x), r6=130(y), r7=69(width), r8=16(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=321(x1), r11=214(y1), r12=173(x2), r13=226(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 247
LDI r1, 204
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 359
LDI r6, 130
LDI r7, 69
LDI r8, 16
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 321
LDI r11, 214
LDI r12, 173
LDI r13, 226
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
