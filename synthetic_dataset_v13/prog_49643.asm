; DESCRIPTION: Composite: Sets a single yellow pixel at (482, 114) then Places a yellow 53x73 rectangle at position (221, 8) then Renders a red disk with center (338, 152) and radius 76.
; PLAN: r0=482(x), r1=114(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=221(x), r6=8(y), r7=53(width), r8=73(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=338(x), r11=152(y), r12=76(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 482
LDI r1, 114
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 221
LDI r6, 8
LDI r7, 53
LDI r8, 73
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 338
LDI r11, 152
LDI r12, 76
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
