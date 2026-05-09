; DESCRIPTION: Composite: Sets a single red pixel at (165, 73) then Renders a yellow line between points (53, 190) and (190, 94) then Renders a purple box of size 14x68 starting at (402, 133).
; PLAN: r0=165(x), r1=73(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=53(x1), r6=190(y1), r7=190(x2), r8=94(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=402(x), r11=133(y), r12=14(width), r13=68(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 165
LDI r1, 73
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 53
LDI r6, 190
LDI r7, 190
LDI r8, 94
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 402
LDI r11, 133
LDI r12, 14
LDI r13, 68
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
