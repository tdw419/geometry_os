; DESCRIPTION: Composite: Sets a single white pixel at (164, 99) then Renders a orange line between points (395, 53) and (43, 49).
; PLAN: r0=164(x), r1=99(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=395(x1), r6=53(y1), r7=43(x2), r8=49(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 164
LDI r1, 99
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 395
LDI r6, 53
LDI r7, 43
LDI r8, 49
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
