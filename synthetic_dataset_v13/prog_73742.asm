; DESCRIPTION: Composite: Sets a single yellow pixel at (322, 43) then Draws a cyan rectangle at (201, 60) with width 39 and height 88 then Renders a cyan line between points (315, 76) and (363, 31).
; PLAN: r0=322(x), r1=43(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=201(x), r6=60(y), r7=39(width), r8=88(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=315(x1), r11=76(y1), r12=363(x2), r13=31(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 322
LDI r1, 43
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 201
LDI r6, 60
LDI r7, 39
LDI r8, 88
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 315
LDI r11, 76
LDI r12, 363
LDI r13, 31
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
