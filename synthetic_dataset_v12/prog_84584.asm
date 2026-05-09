; DESCRIPTION: Composite: Places a white dot at position (353, 207) then Renders a cyan box of size 38x53 starting at (240, 22) then Creates a yellow circular shape at (69, 61) with radius 29.
; PLAN: r0=353(x), r1=207(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=240(x), r6=22(y), r7=38(width), r8=53(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=69(x), r11=61(y), r12=29(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 353
LDI r1, 207
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 240
LDI r6, 22
LDI r7, 38
LDI r8, 53
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 69
LDI r11, 61
LDI r12, 29
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
