; DESCRIPTION: Composite: Places a yellow line segment connecting (249, 41) to (412, 8) then Places a white circle of radius 67 at center (220, 183).
; PLAN: r0=249(x1), r1=41(y1), r2=412(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=220(x), r6=183(y), r7=67(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 249
LDI r1, 41
LDI r2, 412
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 183
LDI r7, 67
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
