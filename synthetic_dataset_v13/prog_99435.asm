; DESCRIPTION: Composite: Draws a red rectangle at (169, 61) with width 108 and height 74 then Places a red dot at position (297, 142) then Creates a red circular shape at (94, 141) with radius 80.
; PLAN: r0=169(x), r1=61(y), r2=108(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=297(x), r6=142(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=94(x), r11=141(y), r12=80(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 169
LDI r1, 61
LDI r2, 108
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 142
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 94
LDI r11, 141
LDI r12, 80
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
