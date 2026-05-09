; DESCRIPTION: Composite: Sets a single green pixel at (246, 0) then Places a yellow line segment connecting (114, 111) to (87, 93) then Creates a white circular shape at (305, 67) with radius 63.
; PLAN: r0=246(x), r1=0(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=114(x1), r6=111(y1), r7=87(x2), r8=93(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=305(x), r11=67(y), r12=63(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 246
LDI r1, 0
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 114
LDI r6, 111
LDI r7, 87
LDI r8, 93
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 67
LDI r12, 63
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
