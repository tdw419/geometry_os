; DESCRIPTION: Composite: Renders a orange line between points (69, 252) and (473, 85) then Places a red 14x64 rectangle at position (319, 48) then Places a blue dot at position (433, 101).
; PLAN: r0=69(x1), r1=252(y1), r2=473(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=319(x), r6=48(y), r7=14(width), r8=64(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=433(x), r11=101(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 69
LDI r1, 252
LDI r2, 473
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 48
LDI r7, 14
LDI r8, 64
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 433
LDI r11, 101
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
