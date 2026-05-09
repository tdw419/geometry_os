; DESCRIPTION: Composite: Renders a magenta box of size 106x106 starting at (373, 62) then Draws a yellow line from (457, 73) to (154, 133) then Places a orange dot at position (472, 225).
; PLAN: r0=373(x), r1=62(y), r2=106(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=457(x1), r6=73(y1), r7=154(x2), r8=133(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=472(x), r11=225(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 373
LDI r1, 62
LDI r2, 106
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 73
LDI r7, 154
LDI r8, 133
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 472
LDI r11, 225
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
