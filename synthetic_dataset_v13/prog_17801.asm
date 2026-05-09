; DESCRIPTION: Composite: Places a black dot at position (96, 242) then Draws a green line from (97, 39) to (50, 178) then Draws a yellow circle centered at (123, 52) with radius 43.
; PLAN: r0=96(x), r1=242(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=97(x1), r6=39(y1), r7=50(x2), r8=178(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=123(x), r11=52(y), r12=43(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 96
LDI r1, 242
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 97
LDI r6, 39
LDI r7, 50
LDI r8, 178
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 123
LDI r11, 52
LDI r12, 43
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
