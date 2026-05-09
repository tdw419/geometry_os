; DESCRIPTION: Composite: Draws a green line from (248, 239) to (35, 201) then Places a green dot at position (443, 28) then Places a green circle of radius 68 at center (230, 115).
; PLAN: r0=248(x1), r1=239(y1), r2=35(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=443(x), r6=28(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=230(x), r11=115(y), r12=68(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 248
LDI r1, 239
LDI r2, 35
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 28
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 230
LDI r11, 115
LDI r12, 68
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
