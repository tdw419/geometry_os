; DESCRIPTION: Composite: Renders a white box of size 21x114 starting at (448, 53) then Renders a white line between points (458, 82) and (202, 42) then Renders a magenta disk with center (222, 80) and radius 70.
; PLAN: r0=448(x), r1=53(y), r2=21(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=458(x1), r6=82(y1), r7=202(x2), r8=42(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=222(x), r11=80(y), r12=70(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 448
LDI r1, 53
LDI r2, 21
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 82
LDI r7, 202
LDI r8, 42
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 222
LDI r11, 80
LDI r12, 70
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
