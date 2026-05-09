; DESCRIPTION: Composite: Places a green circle of radius 20 at center (402, 163) then Places a blue 19x50 rectangle at position (229, 175).
; PLAN: r0=402(x), r1=163(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=229(x), r6=175(y), r7=19(width), r8=50(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 402
LDI r1, 163
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 229
LDI r6, 175
LDI r7, 19
LDI r8, 50
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
