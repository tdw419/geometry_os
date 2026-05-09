; DESCRIPTION: Composite: Draws a yellow circle centered at (280, 163) with radius 44 then Places a green line segment connecting (374, 14) to (474, 228).
; PLAN: r0=280(x), r1=163(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=374(x1), r6=14(y1), r7=474(x2), r8=228(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 163
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 374
LDI r6, 14
LDI r7, 474
LDI r8, 228
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
