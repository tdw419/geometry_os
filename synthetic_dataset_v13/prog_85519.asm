; DESCRIPTION: Composite: Places a magenta circle of radius 54 at center (160, 145) then Creates a magenta rectangular region at (406, 165) spanning 67 by 84 pixels.
; PLAN: r0=160(x), r1=145(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x), r6=165(y), r7=67(width), r8=84(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 160
LDI r1, 145
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 165
LDI r7, 67
LDI r8, 84
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
