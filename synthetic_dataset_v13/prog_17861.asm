; DESCRIPTION: Composite: Creates a magenta rectangular region at (468, 10) spanning 11 by 87 pixels then Places a white circle of radius 44 at center (333, 106) then Renders a red line between points (453, 161) and (256, 226).
; PLAN: r0=468(x), r1=10(y), r2=11(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=333(x), r6=106(y), r7=44(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=453(x1), r11=161(y1), r12=256(x2), r13=226(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 468
LDI r1, 10
LDI r2, 11
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 106
LDI r7, 44
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 453
LDI r11, 161
LDI r12, 256
LDI r13, 226
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
