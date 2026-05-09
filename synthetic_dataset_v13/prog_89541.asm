; DESCRIPTION: Composite: Sets a single orange pixel at (153, 87) then Creates a orange rectangular region at (180, 142) spanning 47 by 99 pixels then Places a blue line segment connecting (253, 37) to (271, 199).
; PLAN: r0=153(x), r1=87(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=180(x), r6=142(y), r7=47(width), r8=99(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=253(x1), r11=37(y1), r12=271(x2), r13=199(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 153
LDI r1, 87
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 180
LDI r6, 142
LDI r7, 47
LDI r8, 99
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 37
LDI r12, 271
LDI r13, 199
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
