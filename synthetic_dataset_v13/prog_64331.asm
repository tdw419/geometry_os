; DESCRIPTION: Composite: Places a black circle of radius 12 at center (451, 103) then Draws a orange line from (141, 126) to (146, 70).
; PLAN: r0=451(x), r1=103(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x1), r6=126(y1), r7=146(x2), r8=70(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 451
LDI r1, 103
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 126
LDI r7, 146
LDI r8, 70
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
