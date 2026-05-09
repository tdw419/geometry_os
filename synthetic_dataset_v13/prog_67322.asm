; DESCRIPTION: Composite: Creates a blue circular shape at (389, 47) with radius 34 then Places a blue dot at position (112, 178) then Places a yellow 17x97 rectangle at position (18, 20).
; PLAN: r0=389(x), r1=47(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=112(x), r6=178(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=18(x), r11=20(y), r12=17(width), r13=97(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 389
LDI r1, 47
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 112
LDI r6, 178
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 18
LDI r11, 20
LDI r12, 17
LDI r13, 97
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
