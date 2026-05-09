; DESCRIPTION: Composite: Places a white line segment connecting (294, 97) to (200, 152) then Places a orange dot at position (23, 43) then Draws a white circle centered at (394, 111) with radius 68.
; PLAN: r0=294(x1), r1=97(y1), r2=200(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=23(x), r6=43(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=394(x), r11=111(y), r12=68(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 294
LDI r1, 97
LDI r2, 200
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 43
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 394
LDI r11, 111
LDI r12, 68
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
