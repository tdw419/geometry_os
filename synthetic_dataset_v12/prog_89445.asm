; DESCRIPTION: Composite: Places a orange 34x58 rectangle at position (64, 93) then Places a orange dot at position (72, 221) then Creates a cyan circular shape at (342, 119) with radius 40.
; PLAN: r0=64(x), r1=93(y), r2=34(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=72(x), r6=221(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=342(x), r11=119(y), r12=40(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 64
LDI r1, 93
LDI r2, 34
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 221
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 342
LDI r11, 119
LDI r12, 40
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
