; DESCRIPTION: Composite: Draws a black circle centered at (445, 147) with radius 37 then Creates a yellow rectangular region at (401, 174) spanning 80 by 10 pixels.
; PLAN: r0=445(x), r1=147(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=401(x), r6=174(y), r7=80(width), r8=10(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 445
LDI r1, 147
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 401
LDI r6, 174
LDI r7, 80
LDI r8, 10
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
