; DESCRIPTION: Composite: Draws a red circle centered at (218, 144) with radius 62 then Draws a green line from (482, 23) to (25, 136).
; PLAN: r0=218(x), r1=144(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=482(x1), r6=23(y1), r7=25(x2), r8=136(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 144
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 482
LDI r6, 23
LDI r7, 25
LDI r8, 136
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
