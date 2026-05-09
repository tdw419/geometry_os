; DESCRIPTION: Composite: Places a magenta dot at position (49, 26) then Renders a white line between points (493, 152) and (486, 137) then Creates a cyan circular shape at (350, 59) with radius 58.
; PLAN: r0=49(x), r1=26(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=493(x1), r6=152(y1), r7=486(x2), r8=137(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=350(x), r11=59(y), r12=58(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 49
LDI r1, 26
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 493
LDI r6, 152
LDI r7, 486
LDI r8, 137
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 350
LDI r11, 59
LDI r12, 58
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
