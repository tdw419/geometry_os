; DESCRIPTION: Composite: Renders a magenta line between points (180, 61) and (57, 204) then Places a black dot at position (221, 49) then Draws a red rectangle at (13, 14) with width 18 and height 106.
; PLAN: r0=180(x1), r1=61(y1), r2=57(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=221(x), r6=49(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=13(x), r11=14(y), r12=18(width), r13=106(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 180
LDI r1, 61
LDI r2, 57
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 49
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 13
LDI r11, 14
LDI r12, 18
LDI r13, 106
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
