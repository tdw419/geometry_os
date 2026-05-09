; DESCRIPTION: Composite: Creates a black circular shape at (313, 119) with radius 70 then Places a red dot at position (63, 110) then Places a orange 78x22 rectangle at position (286, 204).
; PLAN: r0=313(x), r1=119(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=63(x), r6=110(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=286(x), r11=204(y), r12=78(width), r13=22(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 119
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 63
LDI r6, 110
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 286
LDI r11, 204
LDI r12, 78
LDI r13, 22
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
