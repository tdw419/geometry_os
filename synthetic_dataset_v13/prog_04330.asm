; DESCRIPTION: Composite: Draws a orange line from (249, 195) to (410, 119) then Places a blue circle of radius 69 at center (340, 121).
; PLAN: r0=249(x1), r1=195(y1), r2=410(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=340(x), r6=121(y), r7=69(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 249
LDI r1, 195
LDI r2, 410
LDI r3, 119
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 121
LDI r7, 69
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
