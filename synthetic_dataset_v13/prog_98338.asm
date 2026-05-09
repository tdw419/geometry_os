; DESCRIPTION: Composite: Draws a magenta circle centered at (368, 144) with radius 39 then Draws a green line from (347, 152) to (322, 56).
; PLAN: r0=368(x), r1=144(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=347(x1), r6=152(y1), r7=322(x2), r8=56(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 368
LDI r1, 144
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 347
LDI r6, 152
LDI r7, 322
LDI r8, 56
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
