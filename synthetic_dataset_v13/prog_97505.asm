; DESCRIPTION: Composite: Creates a green rectangular region at (28, 196) spanning 81 by 56 pixels then Places a white line segment connecting (395, 251) to (364, 46) then Places a orange dot at position (108, 4).
; PLAN: r0=28(x), r1=196(y), r2=81(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=395(x1), r6=251(y1), r7=364(x2), r8=46(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=108(x), r11=4(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 28
LDI r1, 196
LDI r2, 81
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 251
LDI r7, 364
LDI r8, 46
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 108
LDI r11, 4
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
