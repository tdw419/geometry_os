; DESCRIPTION: Composite: Draws a purple rectangle at (165, 86) with width 66 and height 44 then Places a green dot at position (112, 70) then Creates a red circular shape at (40, 129) with radius 18.
; PLAN: r0=165(x), r1=86(y), r2=66(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=112(x), r6=70(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=40(x), r11=129(y), r12=18(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 165
LDI r1, 86
LDI r2, 66
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 70
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 40
LDI r11, 129
LDI r12, 18
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
