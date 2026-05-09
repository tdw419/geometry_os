; DESCRIPTION: Composite: Sets a single white pixel at (10, 61) then Renders a magenta disk with center (87, 113) and radius 48 then Draws a purple line from (101, 186) to (281, 74).
; PLAN: r0=10(x), r1=61(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=87(x), r6=113(y), r7=48(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=101(x1), r11=186(y1), r12=281(x2), r13=74(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 10
LDI r1, 61
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 87
LDI r6, 113
LDI r7, 48
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 101
LDI r11, 186
LDI r12, 281
LDI r13, 74
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
