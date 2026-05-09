; DESCRIPTION: Composite: Places a magenta 85x111 rectangle at position (61, 98) then Places a purple dot at position (104, 231) then Renders a purple disk with center (264, 137) and radius 28.
; PLAN: r0=61(x), r1=98(y), r2=85(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=104(x), r6=231(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=264(x), r11=137(y), r12=28(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 61
LDI r1, 98
LDI r2, 85
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 231
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 264
LDI r11, 137
LDI r12, 28
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
