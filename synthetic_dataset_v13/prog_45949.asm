; DESCRIPTION: Composite: Places a purple 91x44 rectangle at position (95, 81) then Places a cyan line segment connecting (129, 79) to (423, 244) then Sets a single magenta pixel at (299, 192).
; PLAN: r0=95(x), r1=81(y), r2=91(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=129(x1), r6=79(y1), r7=423(x2), r8=244(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=299(x), r11=192(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 95
LDI r1, 81
LDI r2, 91
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 79
LDI r7, 423
LDI r8, 244
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 299
LDI r11, 192
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
