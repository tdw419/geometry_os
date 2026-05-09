; DESCRIPTION: Composite: Draws a purple line from (458, 231) to (466, 129) then Draws a green rectangle at (286, 99) with width 57 and height 59 then Creates a magenta circular shape at (187, 64) with radius 50.
; PLAN: r0=458(x1), r1=231(y1), r2=466(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=286(x), r6=99(y), r7=57(width), r8=59(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=187(x), r11=64(y), r12=50(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 458
LDI r1, 231
LDI r2, 466
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 99
LDI r7, 57
LDI r8, 59
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 64
LDI r12, 50
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
