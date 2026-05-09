; DESCRIPTION: Composite: Renders a yellow line between points (189, 122) and (135, 147) then Renders a black disk with center (115, 51) and radius 32 then Places a red dot at position (374, 36).
; PLAN: r0=189(x1), r1=122(y1), r2=135(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=51(y), r7=32(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=374(x), r11=36(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 189
LDI r1, 122
LDI r2, 135
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 51
LDI r7, 32
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 374
LDI r11, 36
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
