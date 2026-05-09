; DESCRIPTION: Composite: Creates a green circular shape at (163, 81) with radius 45 then Places a yellow 47x105 rectangle at position (448, 75) then Sets a single magenta pixel at (162, 13).
; PLAN: r0=163(x), r1=81(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=448(x), r6=75(y), r7=47(width), r8=105(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=162(x), r11=13(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 163
LDI r1, 81
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 448
LDI r6, 75
LDI r7, 47
LDI r8, 105
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 13
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
