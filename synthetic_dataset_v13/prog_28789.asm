; DESCRIPTION: Composite: Sets a single magenta pixel at (25, 155) then Places a green circle of radius 79 at center (371, 167) then Places a cyan 31x75 rectangle at position (233, 141).
; PLAN: r0=25(x), r1=155(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=371(x), r6=167(y), r7=79(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=233(x), r11=141(y), r12=31(width), r13=75(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 25
LDI r1, 155
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 371
LDI r6, 167
LDI r7, 79
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 233
LDI r11, 141
LDI r12, 31
LDI r13, 75
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
