; DESCRIPTION: Composite: Places a purple dot at position (429, 56) then Draws a red circle centered at (302, 159) with radius 77 then Places a cyan line segment connecting (334, 166) to (119, 210).
; PLAN: r0=429(x), r1=56(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=302(x), r6=159(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=334(x1), r11=166(y1), r12=119(x2), r13=210(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 56
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 302
LDI r6, 159
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 334
LDI r11, 166
LDI r12, 119
LDI r13, 210
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
