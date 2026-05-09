; DESCRIPTION: Composite: Places a orange line segment connecting (221, 208) to (47, 64) then Renders a cyan box of size 113x43 starting at (186, 143) then Renders a purple disk with center (258, 143) and radius 67.
; PLAN: r0=221(x1), r1=208(y1), r2=47(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=186(x), r6=143(y), r7=113(width), r8=43(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=258(x), r11=143(y), r12=67(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 221
LDI r1, 208
LDI r2, 47
LDI r3, 64
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 143
LDI r7, 113
LDI r8, 43
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 258
LDI r11, 143
LDI r12, 67
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
