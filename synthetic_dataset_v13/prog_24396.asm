; DESCRIPTION: Composite: Places a cyan dot at position (30, 0) then Renders a yellow line between points (196, 44) and (165, 203) then Places a orange circle of radius 33 at center (279, 138).
; PLAN: r0=30(x), r1=0(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=196(x1), r6=44(y1), r7=165(x2), r8=203(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=279(x), r11=138(y), r12=33(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 30
LDI r1, 0
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 196
LDI r6, 44
LDI r7, 165
LDI r8, 203
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 279
LDI r11, 138
LDI r12, 33
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
