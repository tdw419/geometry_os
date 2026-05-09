; DESCRIPTION: Composite: Places a red circle of radius 73 at center (345, 106) then Renders a red box of size 98x31 starting at (129, 87) then Draws a red line from (255, 80) to (214, 242).
; PLAN: r0=345(x), r1=106(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=129(x), r6=87(y), r7=98(width), r8=31(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=255(x1), r11=80(y1), r12=214(x2), r13=242(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 345
LDI r1, 106
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 129
LDI r6, 87
LDI r7, 98
LDI r8, 31
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 80
LDI r12, 214
LDI r13, 242
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
