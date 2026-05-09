; DESCRIPTION: Composite: Places a cyan circle of radius 54 at center (450, 65) then Renders a green line between points (27, 217) and (100, 246) then Renders a red box of size 40x74 starting at (3, 158).
; PLAN: r0=450(x), r1=65(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=27(x1), r6=217(y1), r7=100(x2), r8=246(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=3(x), r11=158(y), r12=40(width), r13=74(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 450
LDI r1, 65
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 27
LDI r6, 217
LDI r7, 100
LDI r8, 246
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 3
LDI r11, 158
LDI r12, 40
LDI r13, 74
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
