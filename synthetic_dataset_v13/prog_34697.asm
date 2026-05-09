; DESCRIPTION: Composite: Places a green dot at position (115, 200) then Renders a white line between points (466, 13) and (196, 126) then Creates a magenta rectangular region at (385, 110) spanning 34 by 94 pixels.
; PLAN: r0=115(x), r1=200(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=466(x1), r6=13(y1), r7=196(x2), r8=126(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=385(x), r11=110(y), r12=34(width), r13=94(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 115
LDI r1, 200
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 466
LDI r6, 13
LDI r7, 196
LDI r8, 126
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 385
LDI r11, 110
LDI r12, 34
LDI r13, 94
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
