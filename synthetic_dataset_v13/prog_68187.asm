; DESCRIPTION: Composite: Places a white circle of radius 47 at center (342, 207) then Renders a red line between points (412, 110) and (461, 116) then Places a red dot at position (84, 138).
; PLAN: r0=342(x), r1=207(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=412(x1), r6=110(y1), r7=461(x2), r8=116(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=84(x), r11=138(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 342
LDI r1, 207
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 412
LDI r6, 110
LDI r7, 461
LDI r8, 116
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 84
LDI r11, 138
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
