; DESCRIPTION: Composite: Creates a red rectangular region at (184, 142) spanning 34 by 104 pixels then Creates a orange circular shape at (446, 196) with radius 34 then Places a white dot at position (227, 204).
; PLAN: r0=184(x), r1=142(y), r2=34(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x), r6=196(y), r7=34(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=227(x), r11=204(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 184
LDI r1, 142
LDI r2, 34
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 196
LDI r7, 34
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 227
LDI r11, 204
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
