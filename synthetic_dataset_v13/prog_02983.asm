; DESCRIPTION: Composite: Draws a purple rectangle at (127, 47) with width 73 and height 120 then Draws a magenta line from (283, 224) to (356, 97) then Draws a black circle centered at (374, 187) with radius 54.
; PLAN: r0=127(x), r1=47(y), r2=73(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=283(x1), r6=224(y1), r7=356(x2), r8=97(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=374(x), r11=187(y), r12=54(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 127
LDI r1, 47
LDI r2, 73
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 224
LDI r7, 356
LDI r8, 97
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 187
LDI r12, 54
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
