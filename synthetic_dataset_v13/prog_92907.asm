; DESCRIPTION: Composite: Sets a single red pixel at (494, 208) then Places a magenta line segment connecting (224, 218) to (209, 82) then Creates a yellow rectangular region at (289, 113) spanning 55 by 117 pixels.
; PLAN: r0=494(x), r1=208(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=224(x1), r6=218(y1), r7=209(x2), r8=82(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=289(x), r11=113(y), r12=55(width), r13=117(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 494
LDI r1, 208
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 224
LDI r6, 218
LDI r7, 209
LDI r8, 82
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 289
LDI r11, 113
LDI r12, 55
LDI r13, 117
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
