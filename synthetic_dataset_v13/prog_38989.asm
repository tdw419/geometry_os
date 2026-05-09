; DESCRIPTION: Composite: Renders a magenta disk with center (236, 56) and radius 38 then Places a blue line segment connecting (241, 31) to (324, 190) then Places a yellow 111x103 rectangle at position (175, 29).
; PLAN: r0=236(x), r1=56(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=241(x1), r6=31(y1), r7=324(x2), r8=190(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=175(x), r11=29(y), r12=111(width), r13=103(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 236
LDI r1, 56
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 241
LDI r6, 31
LDI r7, 324
LDI r8, 190
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 175
LDI r11, 29
LDI r12, 111
LDI r13, 103
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
