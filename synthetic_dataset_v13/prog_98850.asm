; DESCRIPTION: Composite: Sets a single red pixel at (267, 249) then Draws a yellow rectangle at (138, 133) with width 53 and height 58 then Renders a orange disk with center (42, 108) and radius 11.
; PLAN: r0=267(x), r1=249(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=138(x), r6=133(y), r7=53(width), r8=58(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=42(x), r11=108(y), r12=11(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 267
LDI r1, 249
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 138
LDI r6, 133
LDI r7, 53
LDI r8, 58
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 42
LDI r11, 108
LDI r12, 11
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
