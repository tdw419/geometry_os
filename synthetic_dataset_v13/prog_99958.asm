; DESCRIPTION: Composite: Creates a magenta circular shape at (109, 180) with radius 61 then Draws a yellow line from (395, 176) to (16, 100).
; PLAN: r0=109(x), r1=180(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=395(x1), r6=176(y1), r7=16(x2), r8=100(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 109
LDI r1, 180
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 395
LDI r6, 176
LDI r7, 16
LDI r8, 100
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
