; DESCRIPTION: Composite: Places a green line segment connecting (201, 209) to (184, 130) then Draws a cyan rectangle at (161, 109) with width 24 and height 34.
; PLAN: r0=201(x1), r1=209(y1), r2=184(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=109(y), r7=24(width), r8=34(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 201
LDI r1, 209
LDI r2, 184
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 109
LDI r7, 24
LDI r8, 34
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
