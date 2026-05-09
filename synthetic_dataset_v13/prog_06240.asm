; DESCRIPTION: Composite: Renders a purple line between points (0, 196) and (490, 39) then Places a yellow 29x98 rectangle at position (461, 117) then Places a orange circle of radius 47 at center (218, 132).
; PLAN: r0=0(x1), r1=196(y1), r2=490(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=461(x), r6=117(y), r7=29(width), r8=98(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=218(x), r11=132(y), r12=47(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 0
LDI r1, 196
LDI r2, 490
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 117
LDI r7, 29
LDI r8, 98
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 218
LDI r11, 132
LDI r12, 47
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
