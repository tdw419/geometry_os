; DESCRIPTION: Composite: Draws a purple rectangle at (72, 47) with width 73 and height 74 then Renders a magenta line between points (190, 209) and (276, 44) then Renders a white disk with center (236, 153) and radius 53.
; PLAN: r0=72(x), r1=47(y), r2=73(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=190(x1), r6=209(y1), r7=276(x2), r8=44(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=236(x), r11=153(y), r12=53(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 72
LDI r1, 47
LDI r2, 73
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 209
LDI r7, 276
LDI r8, 44
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 236
LDI r11, 153
LDI r12, 53
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
