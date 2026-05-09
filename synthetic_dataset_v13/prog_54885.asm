; DESCRIPTION: Composite: Renders a black line between points (192, 41) and (146, 106) then Sets a single orange pixel at (397, 48) then Draws a magenta rectangle at (292, 41) with width 92 and height 111.
; PLAN: r0=192(x1), r1=41(y1), r2=146(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=397(x), r6=48(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=292(x), r11=41(y), r12=92(width), r13=111(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 192
LDI r1, 41
LDI r2, 146
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 48
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 292
LDI r11, 41
LDI r12, 92
LDI r13, 111
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
