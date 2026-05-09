; DESCRIPTION: Composite: Places a purple dot at position (145, 194) then Renders a orange box of size 34x53 starting at (242, 182) then Draws a red line from (489, 70) to (270, 184).
; PLAN: r0=145(x), r1=194(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=242(x), r6=182(y), r7=34(width), r8=53(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=489(x1), r11=70(y1), r12=270(x2), r13=184(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 145
LDI r1, 194
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 242
LDI r6, 182
LDI r7, 34
LDI r8, 53
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 489
LDI r11, 70
LDI r12, 270
LDI r13, 184
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
