; DESCRIPTION: Composite: Places a red dot at position (379, 176) then Renders a green box of size 52x82 starting at (24, 135) then Draws a orange line from (158, 137) to (420, 146).
; PLAN: r0=379(x), r1=176(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=24(x), r6=135(y), r7=52(width), r8=82(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=158(x1), r11=137(y1), r12=420(x2), r13=146(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 379
LDI r1, 176
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 24
LDI r6, 135
LDI r7, 52
LDI r8, 82
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 158
LDI r11, 137
LDI r12, 420
LDI r13, 146
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
