; DESCRIPTION: Composite: Places a white 93x117 rectangle at position (43, 16) then Creates a red circular shape at (291, 160) with radius 80 then Sets a single yellow pixel at (155, 92).
; PLAN: r0=43(x), r1=16(y), r2=93(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=291(x), r6=160(y), r7=80(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=155(x), r11=92(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 43
LDI r1, 16
LDI r2, 93
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 160
LDI r7, 80
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 155
LDI r11, 92
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
