; DESCRIPTION: Composite: Places a cyan circle of radius 59 at center (319, 63) then Places a purple dot at position (413, 176) then Draws a magenta line from (129, 154) to (499, 141).
; PLAN: r0=319(x), r1=63(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=413(x), r6=176(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=129(x1), r11=154(y1), r12=499(x2), r13=141(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 319
LDI r1, 63
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 413
LDI r6, 176
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 129
LDI r11, 154
LDI r12, 499
LDI r13, 141
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
