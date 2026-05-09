; DESCRIPTION: Composite: Sets a single yellow pixel at (250, 8) then Draws a red line from (164, 153) to (499, 75) then Places a blue 34x12 rectangle at position (45, 243).
; PLAN: r0=250(x), r1=8(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=164(x1), r6=153(y1), r7=499(x2), r8=75(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=45(x), r11=243(y), r12=34(width), r13=12(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 250
LDI r1, 8
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 164
LDI r6, 153
LDI r7, 499
LDI r8, 75
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 45
LDI r11, 243
LDI r12, 34
LDI r13, 12
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
