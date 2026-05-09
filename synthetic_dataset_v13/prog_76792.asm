; DESCRIPTION: Composite: Draws a blue circle centered at (175, 197) with radius 51 then Draws a orange line from (243, 220) to (374, 5).
; PLAN: r0=175(x), r1=197(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=243(x1), r6=220(y1), r7=374(x2), r8=5(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 175
LDI r1, 197
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 243
LDI r6, 220
LDI r7, 374
LDI r8, 5
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
