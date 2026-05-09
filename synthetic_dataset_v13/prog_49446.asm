; DESCRIPTION: Composite: Creates a green circular shape at (128, 231) with radius 24 then Renders a black line between points (174, 126) and (282, 128).
; PLAN: r0=128(x), r1=231(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=174(x1), r6=126(y1), r7=282(x2), r8=128(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 128
LDI r1, 231
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 174
LDI r6, 126
LDI r7, 282
LDI r8, 128
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
