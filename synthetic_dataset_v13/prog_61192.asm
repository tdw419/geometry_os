; DESCRIPTION: Composite: Renders a yellow box of size 70x24 starting at (433, 68) then Places a purple dot at position (143, 18) then Draws a red circle centered at (421, 124) with radius 77.
; PLAN: r0=433(x), r1=68(y), r2=70(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=143(x), r6=18(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=421(x), r11=124(y), r12=77(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 433
LDI r1, 68
LDI r2, 70
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 18
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 421
LDI r11, 124
LDI r12, 77
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
