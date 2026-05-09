; DESCRIPTION: Composite: Draws a orange line from (29, 186) to (339, 117) then Places a blue circle of radius 52 at center (370, 171).
; PLAN: r0=29(x1), r1=186(y1), r2=339(x2), r3=117(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=370(x), r6=171(y), r7=52(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 29
LDI r1, 186
LDI r2, 339
LDI r3, 117
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 171
LDI r7, 52
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
