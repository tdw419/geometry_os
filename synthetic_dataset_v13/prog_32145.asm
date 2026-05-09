; DESCRIPTION: Composite: Draws a red line from (131, 204) to (163, 151) then Renders a yellow box of size 26x116 starting at (437, 54) then Places a magenta dot at position (5, 23).
; PLAN: r0=131(x1), r1=204(y1), r2=163(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=437(x), r6=54(y), r7=26(width), r8=116(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=5(x), r11=23(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 131
LDI r1, 204
LDI r2, 163
LDI r3, 151
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 54
LDI r7, 26
LDI r8, 116
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 5
LDI r11, 23
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
