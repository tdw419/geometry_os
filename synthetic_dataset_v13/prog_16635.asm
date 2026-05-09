; DESCRIPTION: Composite: Creates a green circular shape at (94, 62) with radius 29 then Draws a green line from (42, 143) to (20, 233).
; PLAN: r0=94(x), r1=62(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=42(x1), r6=143(y1), r7=20(x2), r8=233(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 94
LDI r1, 62
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 42
LDI r6, 143
LDI r7, 20
LDI r8, 233
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
