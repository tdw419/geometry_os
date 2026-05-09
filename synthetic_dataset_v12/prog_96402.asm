; DESCRIPTION: Composite: Draws a black circle centered at (270, 152) with radius 77 then Places a yellow 22x58 rectangle at position (188, 75).
; PLAN: r0=270(x), r1=152(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=188(x), r6=75(y), r7=22(width), r8=58(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 270
LDI r1, 152
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 188
LDI r6, 75
LDI r7, 22
LDI r8, 58
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
