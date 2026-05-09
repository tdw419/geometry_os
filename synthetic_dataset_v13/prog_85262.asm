; DESCRIPTION: Composite: Places a orange dot at position (126, 0) then Places a blue 104x49 rectangle at position (115, 111) then Places a yellow circle of radius 74 at center (80, 106).
; PLAN: r0=126(x), r1=0(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=115(x), r6=111(y), r7=104(width), r8=49(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=80(x), r11=106(y), r12=74(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 126
LDI r1, 0
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 115
LDI r6, 111
LDI r7, 104
LDI r8, 49
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 80
LDI r11, 106
LDI r12, 74
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
