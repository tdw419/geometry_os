; DESCRIPTION: Composite: Creates a green rectangular region at (27, 93) spanning 62 by 40 pixels then Sets a single blue pixel at (418, 229) then Renders a green line between points (418, 198) and (114, 32).
; PLAN: r0=27(x), r1=93(y), r2=62(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x), r6=229(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=418(x1), r11=198(y1), r12=114(x2), r13=32(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 27
LDI r1, 93
LDI r2, 62
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 229
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 418
LDI r11, 198
LDI r12, 114
LDI r13, 32
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
