; DESCRIPTION: Composite: Draws a magenta rectangle at (227, 61) with width 36 and height 66 then Places a cyan dot at position (59, 131) then Draws a purple circle centered at (297, 182) with radius 44.
; PLAN: r0=227(x), r1=61(y), r2=36(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=59(x), r6=131(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=297(x), r11=182(y), r12=44(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 227
LDI r1, 61
LDI r2, 36
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 131
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 297
LDI r11, 182
LDI r12, 44
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
