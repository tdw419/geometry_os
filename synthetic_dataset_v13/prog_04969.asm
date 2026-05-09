; DESCRIPTION: Composite: Places a yellow line segment connecting (165, 46) to (149, 217) then Places a white circle of radius 28 at center (156, 161).
; PLAN: r0=165(x1), r1=46(y1), r2=149(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=156(x), r6=161(y), r7=28(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 165
LDI r1, 46
LDI r2, 149
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 161
LDI r7, 28
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
