; DESCRIPTION: Composite: Places a red dot at position (511, 79) then Places a red line segment connecting (388, 114) to (283, 18) then Renders a green disk with center (445, 168) and radius 46.
; PLAN: r0=511(x), r1=79(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=388(x1), r6=114(y1), r7=283(x2), r8=18(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=445(x), r11=168(y), r12=46(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 511
LDI r1, 79
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 388
LDI r6, 114
LDI r7, 283
LDI r8, 18
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 445
LDI r11, 168
LDI r12, 46
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
