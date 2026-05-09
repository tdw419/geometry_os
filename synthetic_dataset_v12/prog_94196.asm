; DESCRIPTION: Composite: Draws a black line from (81, 162) to (247, 10) then Places a white dot at position (244, 4) then Draws a cyan rectangle at (280, 23) with width 39 and height 106.
; PLAN: r0=81(x1), r1=162(y1), r2=247(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=244(x), r6=4(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=280(x), r11=23(y), r12=39(width), r13=106(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 81
LDI r1, 162
LDI r2, 247
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 4
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 280
LDI r11, 23
LDI r12, 39
LDI r13, 106
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
