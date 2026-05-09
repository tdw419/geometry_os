; DESCRIPTION: Composite: Renders a red disk with center (99, 127) and radius 21 then Draws a red rectangle at (72, 53) with width 35 and height 21.
; PLAN: r0=99(x), r1=127(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=72(x), r6=53(y), r7=35(width), r8=21(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 99
LDI r1, 127
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 72
LDI r6, 53
LDI r7, 35
LDI r8, 21
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
