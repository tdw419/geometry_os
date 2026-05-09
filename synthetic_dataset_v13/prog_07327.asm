; DESCRIPTION: Composite: Places a yellow line segment connecting (244, 198) to (426, 167) then Places a red 42x54 rectangle at position (111, 79).
; PLAN: r0=244(x1), r1=198(y1), r2=426(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=111(x), r6=79(y), r7=42(width), r8=54(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 198
LDI r2, 426
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 79
LDI r7, 42
LDI r8, 54
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
