; DESCRIPTION: Composite: Renders a magenta box of size 72x101 starting at (431, 105) then Places a blue circle of radius 59 at center (370, 85).
; PLAN: r0=431(x), r1=105(y), r2=72(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=370(x), r6=85(y), r7=59(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 431
LDI r1, 105
LDI r2, 72
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 85
LDI r7, 59
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
