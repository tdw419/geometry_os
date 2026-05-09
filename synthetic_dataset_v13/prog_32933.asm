; DESCRIPTION: Composite: Draws a cyan line from (287, 40) to (46, 126) then Sets a single green pixel at (261, 20) then Places a black circle of radius 74 at center (354, 108).
; PLAN: r0=287(x1), r1=40(y1), r2=46(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=20(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=354(x), r11=108(y), r12=74(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 287
LDI r1, 40
LDI r2, 46
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 20
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 354
LDI r11, 108
LDI r12, 74
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
