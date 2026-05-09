; DESCRIPTION: Composite: Places a orange 10x51 rectangle at position (232, 118) then Places a yellow circle of radius 26 at center (78, 214).
; PLAN: r0=232(x), r1=118(y), r2=10(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=78(x), r6=214(y), r7=26(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 232
LDI r1, 118
LDI r2, 10
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 214
LDI r7, 26
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
