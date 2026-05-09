; DESCRIPTION: Composite: Draws a white rectangle at (307, 32) with width 54 and height 88 then Places a green line segment connecting (225, 62) to (1, 211).
; PLAN: r0=307(x), r1=32(y), r2=54(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=225(x1), r6=62(y1), r7=1(x2), r8=211(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 307
LDI r1, 32
LDI r2, 54
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 62
LDI r7, 1
LDI r8, 211
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
