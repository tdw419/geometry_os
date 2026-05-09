; DESCRIPTION: Composite: Renders a yellow line between points (58, 152) and (37, 80) then Places a cyan dot at position (313, 19) then Creates a black rectangular region at (258, 74) spanning 52 by 57 pixels.
; PLAN: r0=58(x1), r1=152(y1), r2=37(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=313(x), r6=19(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=258(x), r11=74(y), r12=52(width), r13=57(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 58
LDI r1, 152
LDI r2, 37
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 19
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 258
LDI r11, 74
LDI r12, 52
LDI r13, 57
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
