; DESCRIPTION: Composite: Sets a single orange pixel at (278, 109) then Places a black 57x26 rectangle at position (450, 138) then Renders a green disk with center (75, 139) and radius 53.
; PLAN: r0=278(x), r1=109(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=450(x), r6=138(y), r7=57(width), r8=26(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=75(x), r11=139(y), r12=53(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 278
LDI r1, 109
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 450
LDI r6, 138
LDI r7, 57
LDI r8, 26
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 75
LDI r11, 139
LDI r12, 53
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
