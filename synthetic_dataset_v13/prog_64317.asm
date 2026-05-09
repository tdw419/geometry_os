; DESCRIPTION: Composite: Places a white dot at position (180, 116) then Renders a red line between points (426, 142) and (357, 161) then Places a red circle of radius 16 at center (25, 76).
; PLAN: r0=180(x), r1=116(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=426(x1), r6=142(y1), r7=357(x2), r8=161(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=25(x), r11=76(y), r12=16(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 180
LDI r1, 116
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 426
LDI r6, 142
LDI r7, 357
LDI r8, 161
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 25
LDI r11, 76
LDI r12, 16
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
