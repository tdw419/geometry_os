; DESCRIPTION: Composite: Places a cyan 72x115 rectangle at position (433, 107) then Creates a orange circular shape at (49, 80) with radius 30.
; PLAN: r0=433(x), r1=107(y), r2=72(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=49(x), r6=80(y), r7=30(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 433
LDI r1, 107
LDI r2, 72
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 80
LDI r7, 30
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
