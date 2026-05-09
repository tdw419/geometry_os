; DESCRIPTION: Composite: Places a orange 56x57 rectangle at position (2, 60) then Places a cyan circle of radius 67 at center (438, 131) then Places a magenta dot at position (318, 77).
; PLAN: r0=2(x), r1=60(y), r2=56(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=438(x), r6=131(y), r7=67(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=318(x), r11=77(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 2
LDI r1, 60
LDI r2, 56
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 131
LDI r7, 67
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 318
LDI r11, 77
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
