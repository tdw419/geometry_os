; DESCRIPTION: Composite: Places a green circle of radius 70 at center (409, 79) then Places a blue 32x86 rectangle at position (423, 110).
; PLAN: r0=409(x), r1=79(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=423(x), r6=110(y), r7=32(width), r8=86(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 79
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 423
LDI r6, 110
LDI r7, 32
LDI r8, 86
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
