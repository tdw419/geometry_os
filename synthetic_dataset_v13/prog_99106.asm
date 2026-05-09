; DESCRIPTION: Composite: Places a white circle of radius 64 at center (100, 129) then Renders a green box of size 73x101 starting at (61, 121) then Renders a orange line between points (468, 144) and (345, 169).
; PLAN: r0=100(x), r1=129(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=61(x), r6=121(y), r7=73(width), r8=101(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=468(x1), r11=144(y1), r12=345(x2), r13=169(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 100
LDI r1, 129
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 61
LDI r6, 121
LDI r7, 73
LDI r8, 101
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 468
LDI r11, 144
LDI r12, 345
LDI r13, 169
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
