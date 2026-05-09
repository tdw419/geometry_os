; DESCRIPTION: Composite: Draws a red line from (174, 91) to (222, 1) then Places a yellow 75x109 rectangle at position (142, 132) then Places a black dot at position (239, 69).
; PLAN: r0=174(x1), r1=91(y1), r2=222(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=142(x), r6=132(y), r7=75(width), r8=109(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=239(x), r11=69(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 174
LDI r1, 91
LDI r2, 222
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 132
LDI r7, 75
LDI r8, 109
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 239
LDI r11, 69
LDI r12, 0x000000
PSET r10, r11, r12
HALT
