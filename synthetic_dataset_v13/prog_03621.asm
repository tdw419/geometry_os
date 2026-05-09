; DESCRIPTION: Composite: Draws a red circle centered at (305, 115) with radius 44 then Renders a orange line between points (468, 42) and (370, 31).
; PLAN: r0=305(x), r1=115(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=468(x1), r6=42(y1), r7=370(x2), r8=31(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 305
LDI r1, 115
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 468
LDI r6, 42
LDI r7, 370
LDI r8, 31
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
