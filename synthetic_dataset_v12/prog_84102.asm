; DESCRIPTION: Composite: Creates a green circular shape at (103, 171) with radius 23 then Draws a yellow line from (26, 215) to (234, 2).
; PLAN: r0=103(x), r1=171(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=26(x1), r6=215(y1), r7=234(x2), r8=2(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 171
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 26
LDI r6, 215
LDI r7, 234
LDI r8, 2
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
