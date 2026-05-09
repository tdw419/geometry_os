; DESCRIPTION: Composite: Renders a purple line between points (263, 201) and (111, 228) then Sets a single green pixel at (209, 196) then Draws a yellow rectangle at (231, 199) with width 94 and height 54.
; PLAN: r0=263(x1), r1=201(y1), r2=111(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=209(x), r6=196(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=231(x), r11=199(y), r12=94(width), r13=54(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 263
LDI r1, 201
LDI r2, 111
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 196
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 231
LDI r11, 199
LDI r12, 94
LDI r13, 54
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
