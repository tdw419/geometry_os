; DESCRIPTION: Composite: Creates a purple circular shape at (401, 134) with radius 48 then Places a yellow 84x66 rectangle at position (325, 142).
; PLAN: r0=401(x), r1=134(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=325(x), r6=142(y), r7=84(width), r8=66(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 401
LDI r1, 134
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 325
LDI r6, 142
LDI r7, 84
LDI r8, 66
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
