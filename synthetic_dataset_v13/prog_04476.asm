; DESCRIPTION: Composite: Draws a green line from (241, 162) to (42, 77) then Creates a red circular shape at (342, 123) with radius 74 then Draws a blue rectangle at (245, 27) with width 12 and height 66.
; PLAN: r0=241(x1), r1=162(y1), r2=42(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=342(x), r6=123(y), r7=74(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=245(x), r11=27(y), r12=12(width), r13=66(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 162
LDI r2, 42
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 123
LDI r7, 74
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 245
LDI r11, 27
LDI r12, 12
LDI r13, 66
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
