; DESCRIPTION: Composite: Renders a orange box of size 113x14 starting at (279, 95) then Sets a single orange pixel at (84, 214) then Creates a cyan circular shape at (74, 87) with radius 57.
; PLAN: r0=279(x), r1=95(y), r2=113(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=84(x), r6=214(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=74(x), r11=87(y), r12=57(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 279
LDI r1, 95
LDI r2, 113
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 214
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 74
LDI r11, 87
LDI r12, 57
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
