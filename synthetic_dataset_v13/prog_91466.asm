; DESCRIPTION: Composite: Places a cyan 21x79 rectangle at position (117, 158) then Creates a orange circular shape at (272, 98) with radius 34.
; PLAN: r0=117(x), r1=158(y), r2=21(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=272(x), r6=98(y), r7=34(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 117
LDI r1, 158
LDI r2, 21
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 98
LDI r7, 34
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
