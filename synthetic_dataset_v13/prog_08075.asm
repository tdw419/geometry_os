; DESCRIPTION: Composite: Places a magenta dot at position (58, 220) then Creates a purple rectangular region at (89, 146) spanning 20 by 33 pixels then Creates a magenta circular shape at (349, 193) with radius 14.
; PLAN: r0=58(x), r1=220(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=89(x), r6=146(y), r7=20(width), r8=33(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=349(x), r11=193(y), r12=14(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 58
LDI r1, 220
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 89
LDI r6, 146
LDI r7, 20
LDI r8, 33
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 349
LDI r11, 193
LDI r12, 14
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
