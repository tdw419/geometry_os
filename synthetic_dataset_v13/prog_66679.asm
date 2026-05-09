; DESCRIPTION: Composite: Places a blue 20x31 rectangle at position (400, 164) then Creates a blue circular shape at (391, 160) with radius 52.
; PLAN: r0=400(x), r1=164(y), r2=20(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x), r6=160(y), r7=52(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 400
LDI r1, 164
LDI r2, 20
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 160
LDI r7, 52
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
