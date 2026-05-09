; DESCRIPTION: Composite: Draws a orange line from (375, 210) to (435, 230) then Renders a blue box of size 100x100 starting at (374, 24).
; PLAN: r0=375(x1), r1=210(y1), r2=435(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=374(x), r6=24(y), r7=100(width), r8=100(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 375
LDI r1, 210
LDI r2, 435
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 24
LDI r7, 100
LDI r8, 100
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
