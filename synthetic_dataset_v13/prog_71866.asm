; DESCRIPTION: Composite: Places a orange 102x50 rectangle at position (54, 75) then Places a black line segment connecting (483, 209) to (425, 121) then Places a magenta dot at position (256, 233).
; PLAN: r0=54(x), r1=75(y), r2=102(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=483(x1), r6=209(y1), r7=425(x2), r8=121(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=256(x), r11=233(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 54
LDI r1, 75
LDI r2, 102
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 483
LDI r6, 209
LDI r7, 425
LDI r8, 121
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 233
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
