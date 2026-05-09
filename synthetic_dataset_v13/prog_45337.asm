; DESCRIPTION: Composite: Places a cyan 104x96 rectangle at position (208, 60) then Creates a blue circular shape at (353, 218) with radius 25.
; PLAN: r0=208(x), r1=60(y), r2=104(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=353(x), r6=218(y), r7=25(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 208
LDI r1, 60
LDI r2, 104
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 218
LDI r7, 25
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
