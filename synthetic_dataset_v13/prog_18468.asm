; DESCRIPTION: Composite: Places a red circle of radius 54 at center (112, 89) then Places a red dot at position (263, 186) then Creates a orange rectangular region at (33, 149) spanning 98 by 43 pixels.
; PLAN: r0=112(x), r1=89(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=263(x), r6=186(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=33(x), r11=149(y), r12=98(width), r13=43(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 112
LDI r1, 89
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 263
LDI r6, 186
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 33
LDI r11, 149
LDI r12, 98
LDI r13, 43
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
