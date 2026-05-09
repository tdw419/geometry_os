; DESCRIPTION: Composite: Places a green 20x77 rectangle at position (160, 41) then Draws a white circle centered at (56, 177) with radius 29 then Places a yellow dot at position (444, 58).
; PLAN: r0=160(x), r1=41(y), r2=20(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=56(x), r6=177(y), r7=29(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=444(x), r11=58(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 160
LDI r1, 41
LDI r2, 20
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 177
LDI r7, 29
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 444
LDI r11, 58
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
