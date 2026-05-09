; DESCRIPTION: Composite: Places a white 42x117 rectangle at position (234, 9) then Places a cyan dot at position (301, 84) then Places a magenta circle of radius 74 at center (414, 87).
; PLAN: r0=234(x), r1=9(y), r2=42(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=301(x), r6=84(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=414(x), r11=87(y), r12=74(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 234
LDI r1, 9
LDI r2, 42
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 84
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 414
LDI r11, 87
LDI r12, 74
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
