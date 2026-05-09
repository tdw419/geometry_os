; DESCRIPTION: Composite: Places a blue dot at position (387, 166) then Places a magenta 66x99 rectangle at position (5, 62) then Creates a black circular shape at (162, 133) with radius 11.
; PLAN: r0=387(x), r1=166(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=5(x), r6=62(y), r7=66(width), r8=99(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=162(x), r11=133(y), r12=11(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 387
LDI r1, 166
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 5
LDI r6, 62
LDI r7, 66
LDI r8, 99
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 133
LDI r12, 11
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
