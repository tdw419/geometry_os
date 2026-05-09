; DESCRIPTION: Composite: Places a black circle of radius 15 at center (285, 48) then Renders a orange box of size 112x110 starting at (202, 59) then Sets a single white pixel at (60, 183).
; PLAN: r0=285(x), r1=48(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=202(x), r6=59(y), r7=112(width), r8=110(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=60(x), r11=183(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 285
LDI r1, 48
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 202
LDI r6, 59
LDI r7, 112
LDI r8, 110
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 60
LDI r11, 183
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
