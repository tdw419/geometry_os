; DESCRIPTION: Composite: Places a yellow circle of radius 37 at center (324, 180) then Creates a magenta rectangular region at (15, 23) spanning 72 by 84 pixels.
; PLAN: r0=324(x), r1=180(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x), r6=23(y), r7=72(width), r8=84(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 324
LDI r1, 180
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 23
LDI r7, 72
LDI r8, 84
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
