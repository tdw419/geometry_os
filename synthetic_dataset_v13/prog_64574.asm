; DESCRIPTION: Composite: Places a blue circle of radius 68 at center (247, 146) then Creates a yellow rectangular region at (347, 167) spanning 12 by 80 pixels.
; PLAN: r0=247(x), r1=146(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=347(x), r6=167(y), r7=12(width), r8=80(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 247
LDI r1, 146
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 347
LDI r6, 167
LDI r7, 12
LDI r8, 80
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
