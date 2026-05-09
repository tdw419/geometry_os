; DESCRIPTION: Composite: Draws a yellow rectangle at (190, 117) with width 98 and height 87 then Places a cyan dot at position (16, 101) then Draws a purple line from (270, 207) to (484, 80).
; PLAN: r0=190(x), r1=117(y), r2=98(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=16(x), r6=101(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=270(x1), r11=207(y1), r12=484(x2), r13=80(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 190
LDI r1, 117
LDI r2, 98
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 101
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 270
LDI r11, 207
LDI r12, 484
LDI r13, 80
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
