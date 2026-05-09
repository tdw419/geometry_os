; DESCRIPTION: Composite: Renders a green line between points (44, 202) and (386, 146) then Creates a cyan circular shape at (326, 189) with radius 61 then Draws a magenta rectangle at (254, 29) with width 67 and height 106.
; PLAN: r0=44(x1), r1=202(y1), r2=386(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=326(x), r6=189(y), r7=61(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=254(x), r11=29(y), r12=67(width), r13=106(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 44
LDI r1, 202
LDI r2, 386
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 189
LDI r7, 61
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 254
LDI r11, 29
LDI r12, 67
LDI r13, 106
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
