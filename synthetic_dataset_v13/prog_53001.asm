; DESCRIPTION: Composite: Places a orange circle of radius 34 at center (167, 134) then Places a green 103x112 rectangle at position (362, 48) then Sets a single purple pixel at (83, 84).
; PLAN: r0=167(x), r1=134(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=362(x), r6=48(y), r7=103(width), r8=112(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=83(x), r11=84(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 167
LDI r1, 134
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 362
LDI r6, 48
LDI r7, 103
LDI r8, 112
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 83
LDI r11, 84
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
