; DESCRIPTION: Composite: Draws a cyan line from (87, 0) to (386, 240) then Places a purple dot at position (345, 238) then Places a white 76x32 rectangle at position (375, 151).
; PLAN: r0=87(x1), r1=0(y1), r2=386(x2), r3=240(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=345(x), r6=238(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=375(x), r11=151(y), r12=76(width), r13=32(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 0
LDI r2, 386
LDI r3, 240
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 238
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 375
LDI r11, 151
LDI r12, 76
LDI r13, 32
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
