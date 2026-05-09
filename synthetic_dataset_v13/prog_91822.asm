; DESCRIPTION: Composite: Places a magenta 77x61 rectangle at position (234, 162) then Places a green circle of radius 20 at center (218, 37).
; PLAN: r0=234(x), r1=162(y), r2=77(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=218(x), r6=37(y), r7=20(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 234
LDI r1, 162
LDI r2, 77
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 37
LDI r7, 20
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
