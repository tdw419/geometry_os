; DESCRIPTION: Composite: Places a red dot at position (156, 44) then Draws a red line from (449, 44) to (368, 210) then Draws a cyan circle centered at (266, 131) with radius 80.
; PLAN: r0=156(x), r1=44(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=449(x1), r6=44(y1), r7=368(x2), r8=210(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=266(x), r11=131(y), r12=80(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 156
LDI r1, 44
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 449
LDI r6, 44
LDI r7, 368
LDI r8, 210
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 266
LDI r11, 131
LDI r12, 80
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
