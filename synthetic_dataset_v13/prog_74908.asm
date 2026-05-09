; DESCRIPTION: Composite: Places a black 60x96 rectangle at position (207, 146) then Renders a green line between points (293, 187) and (271, 53) then Creates a blue circular shape at (409, 103) with radius 20.
; PLAN: r0=207(x), r1=146(y), r2=60(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=293(x1), r6=187(y1), r7=271(x2), r8=53(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=409(x), r11=103(y), r12=20(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 207
LDI r1, 146
LDI r2, 60
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 187
LDI r7, 271
LDI r8, 53
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 103
LDI r12, 20
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
