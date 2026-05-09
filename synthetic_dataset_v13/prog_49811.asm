; DESCRIPTION: Composite: Places a green 75x48 rectangle at position (308, 44) then Places a blue circle of radius 41 at center (379, 179).
; PLAN: r0=308(x), r1=44(y), r2=75(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=379(x), r6=179(y), r7=41(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 308
LDI r1, 44
LDI r2, 75
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 179
LDI r7, 41
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
