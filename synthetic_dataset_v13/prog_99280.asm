; DESCRIPTION: Composite: Renders a yellow line between points (279, 241) and (411, 209) then Draws a yellow rectangle at (115, 62) with width 64 and height 100 then Sets a single black pixel at (21, 1).
; PLAN: r0=279(x1), r1=241(y1), r2=411(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=62(y), r7=64(width), r8=100(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=21(x), r11=1(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 279
LDI r1, 241
LDI r2, 411
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 62
LDI r7, 64
LDI r8, 100
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 21
LDI r11, 1
LDI r12, 0x000000
PSET r10, r11, r12
HALT
