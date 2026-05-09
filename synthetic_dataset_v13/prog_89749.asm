; DESCRIPTION: Composite: Draws a red rectangle at (302, 222) with width 68 and height 29 then Sets a single black pixel at (325, 65) then Places a cyan line segment connecting (113, 242) to (88, 111).
; PLAN: r0=302(x), r1=222(y), r2=68(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=325(x), r6=65(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=113(x1), r11=242(y1), r12=88(x2), r13=111(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 302
LDI r1, 222
LDI r2, 68
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 65
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 113
LDI r11, 242
LDI r12, 88
LDI r13, 111
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
