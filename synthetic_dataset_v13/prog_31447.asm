; DESCRIPTION: Composite: Sets a single yellow pixel at (84, 61) then Places a red circle of radius 33 at center (150, 166) then Places a magenta 90x68 rectangle at position (373, 150).
; PLAN: r0=84(x), r1=61(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=150(x), r6=166(y), r7=33(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=373(x), r11=150(y), r12=90(width), r13=68(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 84
LDI r1, 61
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 150
LDI r6, 166
LDI r7, 33
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 373
LDI r11, 150
LDI r12, 90
LDI r13, 68
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
