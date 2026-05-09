; DESCRIPTION: Composite: Places a cyan dot at position (274, 230) then Draws a purple circle centered at (272, 109) with radius 80 then Draws a purple line from (279, 239) to (462, 112).
; PLAN: r0=274(x), r1=230(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=272(x), r6=109(y), r7=80(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=279(x1), r11=239(y1), r12=462(x2), r13=112(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 274
LDI r1, 230
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 272
LDI r6, 109
LDI r7, 80
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 279
LDI r11, 239
LDI r12, 462
LDI r13, 112
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
