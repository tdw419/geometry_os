; DESCRIPTION: Composite: Places a yellow dot at position (310, 127) then Draws a red line from (302, 222) to (319, 108) then Renders a cyan box of size 26x49 starting at (380, 14).
; PLAN: r0=310(x), r1=127(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=302(x1), r6=222(y1), r7=319(x2), r8=108(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=380(x), r11=14(y), r12=26(width), r13=49(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 310
LDI r1, 127
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 302
LDI r6, 222
LDI r7, 319
LDI r8, 108
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 380
LDI r11, 14
LDI r12, 26
LDI r13, 49
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
