; DESCRIPTION: Composite: Renders a white line between points (402, 202) and (481, 96) then Creates a red circular shape at (225, 190) with radius 65 then Renders a yellow box of size 74x30 starting at (138, 54).
; PLAN: r0=402(x1), r1=202(y1), r2=481(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=225(x), r6=190(y), r7=65(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=138(x), r11=54(y), r12=74(width), r13=30(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 402
LDI r1, 202
LDI r2, 481
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 190
LDI r7, 65
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 138
LDI r11, 54
LDI r12, 74
LDI r13, 30
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
