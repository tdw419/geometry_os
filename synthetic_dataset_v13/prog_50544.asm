; DESCRIPTION: Composite: Places a black 82x65 rectangle at position (337, 147) then Places a black line segment connecting (54, 102) to (352, 187) then Places a magenta circle of radius 26 at center (135, 192).
; PLAN: r0=337(x), r1=147(y), r2=82(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=54(x1), r6=102(y1), r7=352(x2), r8=187(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=135(x), r11=192(y), r12=26(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 337
LDI r1, 147
LDI r2, 82
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 102
LDI r7, 352
LDI r8, 187
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 135
LDI r11, 192
LDI r12, 26
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
