; DESCRIPTION: Composite: Places a white circle of radius 77 at center (238, 120) then Places a magenta line segment connecting (348, 34) to (381, 25) then Places a red dot at position (270, 240).
; PLAN: r0=238(x), r1=120(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x1), r6=34(y1), r7=381(x2), r8=25(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=270(x), r11=240(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 238
LDI r1, 120
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 34
LDI r7, 381
LDI r8, 25
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 270
LDI r11, 240
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
