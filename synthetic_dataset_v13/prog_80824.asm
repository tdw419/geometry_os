; DESCRIPTION: Composite: Sets a single yellow pixel at (68, 146) then Draws a green circle centered at (113, 126) with radius 62 then Places a green line segment connecting (88, 81) to (53, 124).
; PLAN: r0=68(x), r1=146(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=113(x), r6=126(y), r7=62(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=88(x1), r11=81(y1), r12=53(x2), r13=124(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 68
LDI r1, 146
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 113
LDI r6, 126
LDI r7, 62
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 88
LDI r11, 81
LDI r12, 53
LDI r13, 124
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
