; DESCRIPTION: Composite: Draws a red circle centered at (441, 72) with radius 31 then Draws a yellow rectangle at (94, 164) with width 31 and height 46.
; PLAN: r0=441(x), r1=72(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=94(x), r6=164(y), r7=31(width), r8=46(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 441
LDI r1, 72
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 94
LDI r6, 164
LDI r7, 31
LDI r8, 46
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
