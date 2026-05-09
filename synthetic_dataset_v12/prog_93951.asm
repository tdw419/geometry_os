; DESCRIPTION: Composite: Draws a red circle centered at (322, 168) with radius 58 then Places a blue dot at position (249, 58) then Draws a magenta line from (299, 248) to (14, 105).
; PLAN: r0=322(x), r1=168(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x), r6=58(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=299(x1), r11=248(y1), r12=14(x2), r13=105(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 322
LDI r1, 168
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 58
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 299
LDI r11, 248
LDI r12, 14
LDI r13, 105
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
