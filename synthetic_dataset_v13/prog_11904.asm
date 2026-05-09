; DESCRIPTION: Composite: Creates a green circular shape at (241, 113) with radius 67 then Draws a blue line from (109, 82) to (77, 166).
; PLAN: r0=241(x), r1=113(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x1), r6=82(y1), r7=77(x2), r8=166(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 113
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 82
LDI r7, 77
LDI r8, 166
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
