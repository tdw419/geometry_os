; DESCRIPTION: Composite: Renders a purple box of size 92x39 starting at (74, 133) then Creates a yellow circular shape at (155, 149) with radius 59.
; PLAN: r0=74(x), r1=133(y), r2=92(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=155(x), r6=149(y), r7=59(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 74
LDI r1, 133
LDI r2, 92
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 149
LDI r7, 59
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
