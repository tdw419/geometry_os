; DESCRIPTION: Composite: Sets a single orange pixel at (201, 29) then Draws a yellow line from (175, 59) to (506, 99) then Places a cyan 102x101 rectangle at position (46, 116).
; PLAN: r0=201(x), r1=29(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=175(x1), r6=59(y1), r7=506(x2), r8=99(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=46(x), r11=116(y), r12=102(width), r13=101(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 201
LDI r1, 29
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 175
LDI r6, 59
LDI r7, 506
LDI r8, 99
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 46
LDI r11, 116
LDI r12, 102
LDI r13, 101
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
