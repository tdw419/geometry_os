; DESCRIPTION: Composite: Sets a single cyan pixel at (20, 248) then Creates a white rectangular region at (294, 97) spanning 112 by 108 pixels then Places a white line segment connecting (226, 92) to (371, 68).
; PLAN: r0=20(x), r1=248(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=294(x), r6=97(y), r7=112(width), r8=108(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=226(x1), r11=92(y1), r12=371(x2), r13=68(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 20
LDI r1, 248
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 294
LDI r6, 97
LDI r7, 112
LDI r8, 108
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 226
LDI r11, 92
LDI r12, 371
LDI r13, 68
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
