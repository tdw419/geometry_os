; DESCRIPTION: Composite: Places a black 17x106 rectangle at position (450, 88) then Creates a red circular shape at (220, 135) with radius 80 then Places a magenta dot at position (477, 214).
; PLAN: r0=450(x), r1=88(y), r2=17(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=220(x), r6=135(y), r7=80(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=477(x), r11=214(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 450
LDI r1, 88
LDI r2, 17
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 135
LDI r7, 80
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 477
LDI r11, 214
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
