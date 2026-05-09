; DESCRIPTION: Composite: Draws a yellow rectangle at (356, 2) with width 117 and height 76 then Sets a single purple pixel at (236, 15) then Places a cyan circle of radius 65 at center (128, 182).
; PLAN: r0=356(x), r1=2(y), r2=117(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x), r6=15(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=128(x), r11=182(y), r12=65(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 356
LDI r1, 2
LDI r2, 117
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 15
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 128
LDI r11, 182
LDI r12, 65
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
