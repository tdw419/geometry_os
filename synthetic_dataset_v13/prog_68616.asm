; DESCRIPTION: Composite: Renders a orange box of size 31x59 starting at (345, 157) then Creates a red circular shape at (394, 53) with radius 48 then Sets a single black pixel at (341, 114).
; PLAN: r0=345(x), r1=157(y), r2=31(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=394(x), r6=53(y), r7=48(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=341(x), r11=114(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 345
LDI r1, 157
LDI r2, 31
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 53
LDI r7, 48
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 341
LDI r11, 114
LDI r12, 0x000000
PSET r10, r11, r12
HALT
