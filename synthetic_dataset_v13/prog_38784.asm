; DESCRIPTION: Composite: Places a red 118x32 rectangle at position (138, 141) then Draws a yellow circle centered at (19, 227) with radius 11.
; PLAN: r0=138(x), r1=141(y), r2=118(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=19(x), r6=227(y), r7=11(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 138
LDI r1, 141
LDI r2, 118
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 227
LDI r7, 11
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
