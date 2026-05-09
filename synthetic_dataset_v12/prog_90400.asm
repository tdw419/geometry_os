; DESCRIPTION: Composite: Draws a red circle centered at (228, 132) with radius 22 then Creates a orange rectangular region at (439, 91) spanning 59 by 116 pixels.
; PLAN: r0=228(x), r1=132(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=439(x), r6=91(y), r7=59(width), r8=116(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 228
LDI r1, 132
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 439
LDI r6, 91
LDI r7, 59
LDI r8, 116
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
