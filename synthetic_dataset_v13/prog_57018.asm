; DESCRIPTION: Composite: Sets a single red pixel at (254, 148) then Creates a black rectangular region at (178, 133) spanning 46 by 81 pixels then Places a white line segment connecting (36, 168) to (500, 236).
; PLAN: r0=254(x), r1=148(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=178(x), r6=133(y), r7=46(width), r8=81(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=36(x1), r11=168(y1), r12=500(x2), r13=236(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 254
LDI r1, 148
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 178
LDI r6, 133
LDI r7, 46
LDI r8, 81
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 36
LDI r11, 168
LDI r12, 500
LDI r13, 236
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
