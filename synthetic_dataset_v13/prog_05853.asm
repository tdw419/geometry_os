; DESCRIPTION: Composite: Sets a single white pixel at (214, 108) then Draws a orange circle centered at (103, 152) with radius 26 then Creates a cyan rectangular region at (58, 202) spanning 118 by 39 pixels.
; PLAN: r0=214(x), r1=108(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=103(x), r6=152(y), r7=26(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=58(x), r11=202(y), r12=118(width), r13=39(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 214
LDI r1, 108
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 103
LDI r6, 152
LDI r7, 26
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 58
LDI r11, 202
LDI r12, 118
LDI r13, 39
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
