; DESCRIPTION: Composite: Draws a red line from (394, 127) to (6, 95) then Creates a orange circular shape at (303, 75) with radius 57.
; PLAN: r0=394(x1), r1=127(y1), r2=6(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=75(y), r7=57(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 394
LDI r1, 127
LDI r2, 6
LDI r3, 95
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 75
LDI r7, 57
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
