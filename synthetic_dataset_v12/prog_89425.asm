; DESCRIPTION: Composite: Places a orange line segment connecting (256, 15) to (405, 12) then Creates a yellow rectangular region at (386, 152) spanning 66 by 78 pixels.
; PLAN: r0=256(x1), r1=15(y1), r2=405(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=386(x), r6=152(y), r7=66(width), r8=78(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 15
LDI r2, 405
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 152
LDI r7, 66
LDI r8, 78
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
