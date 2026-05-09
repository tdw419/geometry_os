; DESCRIPTION: Composite: Places a yellow dot at position (458, 124) then Draws a purple circle centered at (228, 196) with radius 55 then Places a magenta 110x106 rectangle at position (250, 127).
; PLAN: r0=458(x), r1=124(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=228(x), r6=196(y), r7=55(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=250(x), r11=127(y), r12=110(width), r13=106(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 458
LDI r1, 124
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 228
LDI r6, 196
LDI r7, 55
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 250
LDI r11, 127
LDI r12, 110
LDI r13, 106
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
