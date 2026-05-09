; DESCRIPTION: Composite: Places a magenta circle of radius 39 at center (280, 149) then Places a magenta 73x57 rectangle at position (383, 83) then Renders a red line between points (448, 110) and (286, 142).
; PLAN: r0=280(x), r1=149(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=383(x), r6=83(y), r7=73(width), r8=57(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=448(x1), r11=110(y1), r12=286(x2), r13=142(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 280
LDI r1, 149
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 383
LDI r6, 83
LDI r7, 73
LDI r8, 57
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 448
LDI r11, 110
LDI r12, 286
LDI r13, 142
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
