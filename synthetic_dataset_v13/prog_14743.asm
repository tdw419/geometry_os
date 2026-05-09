; DESCRIPTION: Composite: Draws a black line from (242, 187) to (501, 45) then Places a blue circle of radius 71 at center (147, 98).
; PLAN: r0=242(x1), r1=187(y1), r2=501(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=147(x), r6=98(y), r7=71(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 242
LDI r1, 187
LDI r2, 501
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 147
LDI r6, 98
LDI r7, 71
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
