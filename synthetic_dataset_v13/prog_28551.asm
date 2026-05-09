; DESCRIPTION: Composite: Places a purple 56x63 rectangle at position (419, 33) then Creates a cyan circular shape at (255, 79) with radius 28.
; PLAN: r0=419(x), r1=33(y), r2=56(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=255(x), r6=79(y), r7=28(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 419
LDI r1, 33
LDI r2, 56
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 79
LDI r7, 28
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
