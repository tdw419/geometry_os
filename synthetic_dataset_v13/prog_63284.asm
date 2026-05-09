; DESCRIPTION: Composite: Creates a white circular shape at (480, 95) with radius 10 then Draws a yellow line from (62, 28) to (195, 223).
; PLAN: r0=480(x), r1=95(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=62(x1), r6=28(y1), r7=195(x2), r8=223(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 480
LDI r1, 95
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 62
LDI r6, 28
LDI r7, 195
LDI r8, 223
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
