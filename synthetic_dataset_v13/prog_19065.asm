; DESCRIPTION: Composite: Renders a yellow disk with center (448, 114) and radius 34 then Draws a red rectangle at (58, 3) with width 114 and height 38 then Sets a single blue pixel at (502, 103).
; PLAN: r0=448(x), r1=114(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=58(x), r6=3(y), r7=114(width), r8=38(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=502(x), r11=103(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 448
LDI r1, 114
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 58
LDI r6, 3
LDI r7, 114
LDI r8, 38
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 502
LDI r11, 103
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
