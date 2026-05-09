; DESCRIPTION: Composite: Sets a single yellow pixel at (310, 192) then Places a black circle of radius 56 at center (349, 69) then Draws a cyan line from (54, 236) to (304, 40).
; PLAN: r0=310(x), r1=192(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=349(x), r6=69(y), r7=56(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=54(x1), r11=236(y1), r12=304(x2), r13=40(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 310
LDI r1, 192
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 349
LDI r6, 69
LDI r7, 56
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 54
LDI r11, 236
LDI r12, 304
LDI r13, 40
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
