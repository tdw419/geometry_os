; DESCRIPTION: Composite: Places a magenta circle of radius 71 at center (274, 162) then Renders a red line between points (98, 23) and (506, 86) then Places a purple 110x60 rectangle at position (73, 23).
; PLAN: r0=274(x), r1=162(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x1), r6=23(y1), r7=506(x2), r8=86(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=73(x), r11=23(y), r12=110(width), r13=60(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 274
LDI r1, 162
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 23
LDI r7, 506
LDI r8, 86
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 73
LDI r11, 23
LDI r12, 110
LDI r13, 60
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
