; DESCRIPTION: Composite: Draws a black line from (382, 248) to (48, 130) then Draws a cyan circle centered at (207, 149) with radius 62 then Places a white dot at position (366, 227).
; PLAN: r0=382(x1), r1=248(y1), r2=48(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=207(x), r6=149(y), r7=62(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=366(x), r11=227(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 382
LDI r1, 248
LDI r2, 48
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 149
LDI r7, 62
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 366
LDI r11, 227
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
