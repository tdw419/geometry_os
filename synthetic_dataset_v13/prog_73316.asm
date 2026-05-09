; DESCRIPTION: Composite: Sets a single black pixel at (121, 170) then Places a white 31x35 rectangle at position (59, 212) then Places a purple circle of radius 46 at center (204, 171).
; PLAN: r0=121(x), r1=170(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=59(x), r6=212(y), r7=31(width), r8=35(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=204(x), r11=171(y), r12=46(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 121
LDI r1, 170
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 59
LDI r6, 212
LDI r7, 31
LDI r8, 35
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 204
LDI r11, 171
LDI r12, 46
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
