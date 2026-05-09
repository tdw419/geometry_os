; DESCRIPTION: Composite: Draws a purple line from (372, 129) to (85, 210) then Draws a green rectangle at (449, 147) with width 31 and height 100.
; PLAN: r0=372(x1), r1=129(y1), r2=85(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=449(x), r6=147(y), r7=31(width), r8=100(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 129
LDI r2, 85
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 147
LDI r7, 31
LDI r8, 100
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
