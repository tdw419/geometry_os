; DESCRIPTION: Composite: Places a orange 62x110 rectangle at position (368, 124) then Places a yellow line segment connecting (437, 230) to (104, 50) then Sets a single magenta pixel at (329, 166).
; PLAN: r0=368(x), r1=124(y), r2=62(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=437(x1), r6=230(y1), r7=104(x2), r8=50(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=329(x), r11=166(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 368
LDI r1, 124
LDI r2, 62
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 230
LDI r7, 104
LDI r8, 50
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 166
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
