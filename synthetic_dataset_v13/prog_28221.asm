; DESCRIPTION: Composite: Places a blue dot at position (178, 64) then Places a cyan line segment connecting (53, 155) to (291, 63) then Places a green 75x45 rectangle at position (296, 143).
; PLAN: r0=178(x), r1=64(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=53(x1), r6=155(y1), r7=291(x2), r8=63(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=296(x), r11=143(y), r12=75(width), r13=45(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 178
LDI r1, 64
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 53
LDI r6, 155
LDI r7, 291
LDI r8, 63
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 143
LDI r12, 75
LDI r13, 45
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
