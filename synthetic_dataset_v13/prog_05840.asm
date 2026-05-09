; DESCRIPTION: Composite: Places a blue circle of radius 80 at center (385, 171) then Places a blue 97x117 rectangle at position (158, 63).
; PLAN: r0=385(x), r1=171(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=158(x), r6=63(y), r7=97(width), r8=117(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 385
LDI r1, 171
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 158
LDI r6, 63
LDI r7, 97
LDI r8, 117
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
