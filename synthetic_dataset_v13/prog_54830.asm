; DESCRIPTION: Composite: Places a yellow line segment connecting (162, 142) to (287, 176) then Places a green 57x23 rectangle at position (62, 153).
; PLAN: r0=162(x1), r1=142(y1), r2=287(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=62(x), r6=153(y), r7=57(width), r8=23(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 162
LDI r1, 142
LDI r2, 287
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 153
LDI r7, 57
LDI r8, 23
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
