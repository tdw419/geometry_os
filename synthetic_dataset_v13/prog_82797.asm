; DESCRIPTION: Composite: Sets a single cyan pixel at (505, 103) then Renders a red disk with center (364, 78) and radius 78 then Renders a orange line between points (196, 132) and (158, 177).
; PLAN: r0=505(x), r1=103(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=364(x), r6=78(y), r7=78(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=196(x1), r11=132(y1), r12=158(x2), r13=177(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 505
LDI r1, 103
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 364
LDI r6, 78
LDI r7, 78
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 196
LDI r11, 132
LDI r12, 158
LDI r13, 177
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
