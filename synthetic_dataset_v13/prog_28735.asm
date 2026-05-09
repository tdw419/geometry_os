; DESCRIPTION: Composite: Places a cyan 34x115 rectangle at position (383, 25) then Renders a purple line between points (297, 154) and (36, 158) then Places a blue circle of radius 53 at center (292, 182).
; PLAN: r0=383(x), r1=25(y), r2=34(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=297(x1), r6=154(y1), r7=36(x2), r8=158(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=292(x), r11=182(y), r12=53(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 383
LDI r1, 25
LDI r2, 34
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 154
LDI r7, 36
LDI r8, 158
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 292
LDI r11, 182
LDI r12, 53
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
