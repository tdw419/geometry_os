; DESCRIPTION: Composite: Draws a red rectangle at (58, 76) with width 27 and height 104 then Renders a yellow disk with center (446, 133) and radius 61.
; PLAN: r0=58(x), r1=76(y), r2=27(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x), r6=133(y), r7=61(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 58
LDI r1, 76
LDI r2, 27
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 133
LDI r7, 61
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
