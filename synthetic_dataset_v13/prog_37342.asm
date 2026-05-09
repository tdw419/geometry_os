; DESCRIPTION: Composite: Places a white line segment connecting (179, 133) to (197, 175) then Places a yellow 104x70 rectangle at position (288, 96) then Places a purple dot at position (493, 247).
; PLAN: r0=179(x1), r1=133(y1), r2=197(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=288(x), r6=96(y), r7=104(width), r8=70(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=493(x), r11=247(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 179
LDI r1, 133
LDI r2, 197
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 96
LDI r7, 104
LDI r8, 70
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 493
LDI r11, 247
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
