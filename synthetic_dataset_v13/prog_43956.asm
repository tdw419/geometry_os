; DESCRIPTION: Composite: Places a cyan 97x81 rectangle at position (259, 38) then Places a red dot at position (302, 166) then Creates a black circular shape at (313, 41) with radius 34.
; PLAN: r0=259(x), r1=38(y), r2=97(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=302(x), r6=166(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=313(x), r11=41(y), r12=34(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 259
LDI r1, 38
LDI r2, 97
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 166
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 313
LDI r11, 41
LDI r12, 34
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
