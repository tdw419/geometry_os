; DESCRIPTION: Composite: Creates a black rectangular region at (64, 160) spanning 103 by 12 pixels then Places a blue line segment connecting (206, 131) to (475, 178) then Places a yellow dot at position (54, 231).
; PLAN: r0=64(x), r1=160(y), r2=103(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=206(x1), r6=131(y1), r7=475(x2), r8=178(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=54(x), r11=231(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 64
LDI r1, 160
LDI r2, 103
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 131
LDI r7, 475
LDI r8, 178
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 54
LDI r11, 231
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
