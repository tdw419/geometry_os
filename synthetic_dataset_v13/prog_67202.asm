; DESCRIPTION: Composite: Sets a single yellow pixel at (114, 8) then Draws a yellow rectangle at (1, 193) with width 16 and height 46 then Draws a purple line from (174, 119) to (218, 50).
; PLAN: r0=114(x), r1=8(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=1(x), r6=193(y), r7=16(width), r8=46(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=174(x1), r11=119(y1), r12=218(x2), r13=50(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 114
LDI r1, 8
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 1
LDI r6, 193
LDI r7, 16
LDI r8, 46
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 174
LDI r11, 119
LDI r12, 218
LDI r13, 50
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
