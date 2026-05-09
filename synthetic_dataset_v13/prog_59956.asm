; DESCRIPTION: Composite: Places a green line segment connecting (472, 144) to (273, 130) then Places a purple 113x74 rectangle at position (297, 98).
; PLAN: r0=472(x1), r1=144(y1), r2=273(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=98(y), r7=113(width), r8=74(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 472
LDI r1, 144
LDI r2, 273
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 98
LDI r7, 113
LDI r8, 74
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
