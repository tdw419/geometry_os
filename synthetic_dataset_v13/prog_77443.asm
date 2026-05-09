; DESCRIPTION: Composite: Renders a white disk with center (307, 183) and radius 50 then Renders a white box of size 31x63 starting at (328, 113) then Renders a green line between points (440, 103) and (475, 38).
; PLAN: r0=307(x), r1=183(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=328(x), r6=113(y), r7=31(width), r8=63(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=440(x1), r11=103(y1), r12=475(x2), r13=38(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 307
LDI r1, 183
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 328
LDI r6, 113
LDI r7, 31
LDI r8, 63
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 440
LDI r11, 103
LDI r12, 475
LDI r13, 38
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
