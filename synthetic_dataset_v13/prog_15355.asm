; DESCRIPTION: Composite: Places a yellow line segment connecting (284, 234) to (183, 167) then Draws a red circle centered at (334, 171) with radius 42.
; PLAN: r0=284(x1), r1=234(y1), r2=183(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=334(x), r6=171(y), r7=42(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 284
LDI r1, 234
LDI r2, 183
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 171
LDI r7, 42
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
