; DESCRIPTION: Composite: Renders a cyan box of size 87x51 starting at (233, 53) then Sets a single yellow pixel at (293, 50) then Renders a yellow line between points (170, 117) and (296, 238).
; PLAN: r0=233(x), r1=53(y), r2=87(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=293(x), r6=50(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=170(x1), r11=117(y1), r12=296(x2), r13=238(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 233
LDI r1, 53
LDI r2, 87
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 50
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 170
LDI r11, 117
LDI r12, 296
LDI r13, 238
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
