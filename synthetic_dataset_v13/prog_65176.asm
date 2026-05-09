; DESCRIPTION: Composite: Places a blue dot at position (41, 190) then Draws a white circle centered at (186, 155) with radius 66 then Places a yellow 23x70 rectangle at position (170, 117).
; PLAN: r0=41(x), r1=190(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=186(x), r6=155(y), r7=66(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=170(x), r11=117(y), r12=23(width), r13=70(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 41
LDI r1, 190
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 186
LDI r6, 155
LDI r7, 66
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 170
LDI r11, 117
LDI r12, 23
LDI r13, 70
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
