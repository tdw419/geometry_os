; DESCRIPTION: Composite: Places a cyan dot at position (54, 171) then Draws a black line from (18, 150) to (259, 176) then Draws a cyan circle centered at (311, 82) with radius 56.
; PLAN: r0=54(x), r1=171(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=18(x1), r6=150(y1), r7=259(x2), r8=176(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=311(x), r11=82(y), r12=56(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 54
LDI r1, 171
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 18
LDI r6, 150
LDI r7, 259
LDI r8, 176
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 311
LDI r11, 82
LDI r12, 56
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
