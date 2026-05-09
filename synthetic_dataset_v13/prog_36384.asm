; DESCRIPTION: Composite: Renders a red line between points (461, 132) and (104, 186) then Creates a yellow circular shape at (75, 77) with radius 44 then Draws a magenta rectangle at (330, 168) with width 48 and height 31.
; PLAN: r0=461(x1), r1=132(y1), r2=104(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=75(x), r6=77(y), r7=44(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=330(x), r11=168(y), r12=48(width), r13=31(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 461
LDI r1, 132
LDI r2, 104
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 77
LDI r7, 44
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 330
LDI r11, 168
LDI r12, 48
LDI r13, 31
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
