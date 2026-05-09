; DESCRIPTION: Composite: Renders a yellow line between points (355, 5) and (449, 165) then Places a green 66x82 rectangle at position (196, 53) then Sets a single purple pixel at (300, 37).
; PLAN: r0=355(x1), r1=5(y1), r2=449(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=196(x), r6=53(y), r7=66(width), r8=82(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=300(x), r11=37(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 355
LDI r1, 5
LDI r2, 449
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 53
LDI r7, 66
LDI r8, 82
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 300
LDI r11, 37
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
