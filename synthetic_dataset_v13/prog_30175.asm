; DESCRIPTION: Composite: Places a blue circle of radius 18 at center (381, 139) then Places a white dot at position (383, 181) then Renders a cyan box of size 105x44 starting at (286, 168).
; PLAN: r0=381(x), r1=139(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=383(x), r6=181(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=286(x), r11=168(y), r12=105(width), r13=44(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 139
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 383
LDI r6, 181
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 286
LDI r11, 168
LDI r12, 105
LDI r13, 44
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
