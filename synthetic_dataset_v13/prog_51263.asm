; DESCRIPTION: Composite: Sets a single red pixel at (121, 59) then Creates a orange circular shape at (295, 140) with radius 13 then Creates a yellow rectangular region at (443, 1) spanning 64 by 50 pixels.
; PLAN: r0=121(x), r1=59(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=295(x), r6=140(y), r7=13(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=443(x), r11=1(y), r12=64(width), r13=50(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 59
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 295
LDI r6, 140
LDI r7, 13
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 443
LDI r11, 1
LDI r12, 64
LDI r13, 50
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
