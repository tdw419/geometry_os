; DESCRIPTION: Composite: Renders a green disk with center (330, 166) and radius 78 then Places a cyan 37x111 rectangle at position (89, 53) then Renders a blue line between points (344, 74) and (133, 188).
; PLAN: r0=330(x), r1=166(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=89(x), r6=53(y), r7=37(width), r8=111(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=344(x1), r11=74(y1), r12=133(x2), r13=188(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 330
LDI r1, 166
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 89
LDI r6, 53
LDI r7, 37
LDI r8, 111
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 344
LDI r11, 74
LDI r12, 133
LDI r13, 188
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
