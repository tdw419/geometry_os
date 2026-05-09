; DESCRIPTION: Composite: Places a purple dot at position (109, 92) then Renders a green line between points (166, 252) and (298, 198) then Renders a black box of size 94x51 starting at (277, 81).
; PLAN: r0=109(x), r1=92(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=166(x1), r6=252(y1), r7=298(x2), r8=198(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=277(x), r11=81(y), r12=94(width), r13=51(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 109
LDI r1, 92
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 166
LDI r6, 252
LDI r7, 298
LDI r8, 198
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 277
LDI r11, 81
LDI r12, 94
LDI r13, 51
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
