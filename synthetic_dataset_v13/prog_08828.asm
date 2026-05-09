; DESCRIPTION: Composite: Places a magenta circle of radius 49 at center (149, 176) then Creates a white rectangular region at (333, 59) spanning 106 by 116 pixels.
; PLAN: r0=149(x), r1=176(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=333(x), r6=59(y), r7=106(width), r8=116(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 149
LDI r1, 176
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 333
LDI r6, 59
LDI r7, 106
LDI r8, 116
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
