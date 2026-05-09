; DESCRIPTION: Composite: Draws a green circle centered at (324, 62) with radius 59 then Places a white line segment connecting (167, 8) to (164, 99).
; PLAN: r0=324(x), r1=62(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=167(x1), r6=8(y1), r7=164(x2), r8=99(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 324
LDI r1, 62
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 167
LDI r6, 8
LDI r7, 164
LDI r8, 99
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
