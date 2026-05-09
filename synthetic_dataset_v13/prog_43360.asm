; DESCRIPTION: Composite: Draws a blue line from (41, 191) to (422, 99) then Draws a yellow rectangle at (200, 164) with width 50 and height 62.
; PLAN: r0=41(x1), r1=191(y1), r2=422(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=164(y), r7=50(width), r8=62(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 41
LDI r1, 191
LDI r2, 422
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 164
LDI r7, 50
LDI r8, 62
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
