; DESCRIPTION: Composite: Renders a blue box of size 89x74 starting at (409, 136) then Places a cyan line segment connecting (351, 111) to (54, 252) then Places a green dot at position (160, 166).
; PLAN: r0=409(x), r1=136(y), r2=89(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=351(x1), r6=111(y1), r7=54(x2), r8=252(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=160(x), r11=166(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 409
LDI r1, 136
LDI r2, 89
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 111
LDI r7, 54
LDI r8, 252
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 160
LDI r11, 166
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
