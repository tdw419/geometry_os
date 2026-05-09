; DESCRIPTION: Composite: Renders a green box of size 79x84 starting at (353, 46) then Draws a cyan line from (151, 71) to (469, 131) then Draws a cyan circle centered at (425, 166) with radius 39.
; PLAN: r0=353(x), r1=46(y), r2=79(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x1), r6=71(y1), r7=469(x2), r8=131(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=425(x), r11=166(y), r12=39(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 353
LDI r1, 46
LDI r2, 79
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 71
LDI r7, 469
LDI r8, 131
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 425
LDI r11, 166
LDI r12, 39
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
