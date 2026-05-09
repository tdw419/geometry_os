; DESCRIPTION: Composite: Places a black dot at position (26, 116) then Renders a blue box of size 39x40 starting at (82, 90) then Places a red circle of radius 14 at center (334, 192).
; PLAN: r0=26(x), r1=116(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=82(x), r6=90(y), r7=39(width), r8=40(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=334(x), r11=192(y), r12=14(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 26
LDI r1, 116
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 82
LDI r6, 90
LDI r7, 39
LDI r8, 40
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 334
LDI r11, 192
LDI r12, 14
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
