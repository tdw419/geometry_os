; DESCRIPTION: Composite: Places a yellow line segment connecting (191, 8) to (460, 82) then Creates a cyan rectangular region at (170, 107) spanning 14 by 103 pixels then Creates a magenta circular shape at (258, 161) with radius 80.
; PLAN: r0=191(x1), r1=8(y1), r2=460(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=170(x), r6=107(y), r7=14(width), r8=103(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=258(x), r11=161(y), r12=80(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 191
LDI r1, 8
LDI r2, 460
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 107
LDI r7, 14
LDI r8, 103
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 258
LDI r11, 161
LDI r12, 80
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
