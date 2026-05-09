; DESCRIPTION: Composite: Draws a blue rectangle at (305, 186) with width 100 and height 53 then Creates a red circular shape at (432, 188) with radius 31.
; PLAN: r0=305(x), r1=186(y), r2=100(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=432(x), r6=188(y), r7=31(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 305
LDI r1, 186
LDI r2, 100
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 188
LDI r7, 31
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
