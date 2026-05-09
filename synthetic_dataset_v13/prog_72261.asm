; DESCRIPTION: Composite: Places a purple circle of radius 51 at center (290, 55) then Places a magenta 63x103 rectangle at position (163, 99).
; PLAN: r0=290(x), r1=55(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=163(x), r6=99(y), r7=63(width), r8=103(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 290
LDI r1, 55
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 163
LDI r6, 99
LDI r7, 63
LDI r8, 103
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
