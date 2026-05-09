; DESCRIPTION: Composite: Places a green 78x35 rectangle at position (422, 22) then Places a green circle of radius 75 at center (142, 164).
; PLAN: r0=422(x), r1=22(y), r2=78(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=142(x), r6=164(y), r7=75(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 422
LDI r1, 22
LDI r2, 78
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 164
LDI r7, 75
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
