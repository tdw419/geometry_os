; DESCRIPTION: Composite: Places a purple dot at position (91, 168) then Renders a black box of size 16x75 starting at (108, 2) then Draws a black line from (54, 7) to (55, 212).
; PLAN: r0=91(x), r1=168(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=108(x), r6=2(y), r7=16(width), r8=75(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=54(x1), r11=7(y1), r12=55(x2), r13=212(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 168
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 108
LDI r6, 2
LDI r7, 16
LDI r8, 75
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 54
LDI r11, 7
LDI r12, 55
LDI r13, 212
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
