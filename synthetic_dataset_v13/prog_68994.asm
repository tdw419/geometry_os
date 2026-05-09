; DESCRIPTION: Composite: Sets a single yellow pixel at (225, 154) then Places a orange 70x71 rectangle at position (282, 60) then Renders a purple disk with center (104, 157) and radius 11.
; PLAN: r0=225(x), r1=154(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=282(x), r6=60(y), r7=70(width), r8=71(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=104(x), r11=157(y), r12=11(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 225
LDI r1, 154
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 282
LDI r6, 60
LDI r7, 70
LDI r8, 71
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 157
LDI r12, 11
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
