; DESCRIPTION: Composite: Places a blue circle of radius 60 at center (94, 100) then Renders a green box of size 95x34 starting at (337, 212) then Renders a white line between points (445, 87) and (355, 24).
; PLAN: r0=94(x), r1=100(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=337(x), r6=212(y), r7=95(width), r8=34(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=445(x1), r11=87(y1), r12=355(x2), r13=24(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 94
LDI r1, 100
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 337
LDI r6, 212
LDI r7, 95
LDI r8, 34
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 445
LDI r11, 87
LDI r12, 355
LDI r13, 24
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
