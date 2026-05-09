; DESCRIPTION: Composite: Renders a blue box of size 24x111 starting at (31, 126) then Renders a white line between points (468, 37) and (124, 21) then Places a red circle of radius 23 at center (345, 74).
; PLAN: r0=31(x), r1=126(y), r2=24(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=468(x1), r6=37(y1), r7=124(x2), r8=21(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=345(x), r11=74(y), r12=23(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 31
LDI r1, 126
LDI r2, 24
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 37
LDI r7, 124
LDI r8, 21
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 345
LDI r11, 74
LDI r12, 23
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
