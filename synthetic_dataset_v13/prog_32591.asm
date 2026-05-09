; DESCRIPTION: Composite: Renders a yellow disk with center (131, 122) and radius 80 then Draws a red rectangle at (79, 153) with width 65 and height 95.
; PLAN: r0=131(x), r1=122(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=79(x), r6=153(y), r7=65(width), r8=95(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 131
LDI r1, 122
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 79
LDI r6, 153
LDI r7, 65
LDI r8, 95
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
