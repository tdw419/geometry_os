; DESCRIPTION: Composite: Places a yellow circle of radius 58 at center (78, 99) then Places a purple 91x63 rectangle at position (4, 180).
; PLAN: r0=78(x), r1=99(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=4(x), r6=180(y), r7=91(width), r8=63(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 78
LDI r1, 99
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 4
LDI r6, 180
LDI r7, 91
LDI r8, 63
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
