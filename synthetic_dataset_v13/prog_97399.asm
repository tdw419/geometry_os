; DESCRIPTION: Composite: Places a magenta 113x97 rectangle at position (117, 137) then Creates a blue circular shape at (423, 112) with radius 33 then Sets a single cyan pixel at (460, 63).
; PLAN: r0=117(x), r1=137(y), r2=113(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=423(x), r6=112(y), r7=33(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=460(x), r11=63(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 117
LDI r1, 137
LDI r2, 113
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 112
LDI r7, 33
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 460
LDI r11, 63
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
