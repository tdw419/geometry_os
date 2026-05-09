; DESCRIPTION: Composite: Places a blue 42x81 rectangle at position (305, 11) then Sets a single blue pixel at (459, 177) then Renders a yellow disk with center (66, 135) and radius 39.
; PLAN: r0=305(x), r1=11(y), r2=42(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=459(x), r6=177(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=66(x), r11=135(y), r12=39(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 305
LDI r1, 11
LDI r2, 42
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 177
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 66
LDI r11, 135
LDI r12, 39
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
