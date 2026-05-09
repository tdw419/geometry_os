; DESCRIPTION: Composite: Creates a green circular shape at (414, 90) with radius 67 then Renders a blue line between points (330, 151) and (84, 111).
; PLAN: r0=414(x), r1=90(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=330(x1), r6=151(y1), r7=84(x2), r8=111(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 90
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 330
LDI r6, 151
LDI r7, 84
LDI r8, 111
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
