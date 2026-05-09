; DESCRIPTION: Composite: Places a yellow 60x10 rectangle at position (14, 196) then Places a yellow dot at position (504, 244) then Draws a red circle centered at (185, 142) with radius 41.
; PLAN: r0=14(x), r1=196(y), r2=60(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=504(x), r6=244(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=185(x), r11=142(y), r12=41(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 14
LDI r1, 196
LDI r2, 60
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 504
LDI r6, 244
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 185
LDI r11, 142
LDI r12, 41
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
