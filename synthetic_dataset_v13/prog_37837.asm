; DESCRIPTION: Composite: Sets a single green pixel at (134, 243) then Draws a orange rectangle at (266, 58) with width 63 and height 53 then Renders a yellow line between points (209, 99) and (234, 180).
; PLAN: r0=134(x), r1=243(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=266(x), r6=58(y), r7=63(width), r8=53(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=209(x1), r11=99(y1), r12=234(x2), r13=180(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 134
LDI r1, 243
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 266
LDI r6, 58
LDI r7, 63
LDI r8, 53
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 209
LDI r11, 99
LDI r12, 234
LDI r13, 180
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
