; DESCRIPTION: Composite: Renders a purple box of size 93x55 starting at (138, 131) then Draws a red circle centered at (164, 170) with radius 15 then Renders a white line between points (480, 153) and (2, 190).
; PLAN: r0=138(x), r1=131(y), r2=93(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=164(x), r6=170(y), r7=15(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=480(x1), r11=153(y1), r12=2(x2), r13=190(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 138
LDI r1, 131
LDI r2, 93
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 170
LDI r7, 15
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 480
LDI r11, 153
LDI r12, 2
LDI r13, 190
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
