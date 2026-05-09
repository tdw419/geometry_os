; DESCRIPTION: Composite: Draws a white line from (196, 231) to (207, 105) then Sets a single white pixel at (326, 76) then Places a cyan circle of radius 53 at center (204, 71).
; PLAN: r0=196(x1), r1=231(y1), r2=207(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=326(x), r6=76(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=204(x), r11=71(y), r12=53(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 196
LDI r1, 231
LDI r2, 207
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 76
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 204
LDI r11, 71
LDI r12, 53
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
