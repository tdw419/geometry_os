; DESCRIPTION: Composite: Places a white circle of radius 49 at center (125, 146) then Draws a red line from (6, 200) to (363, 73).
; PLAN: r0=125(x), r1=146(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=6(x1), r6=200(y1), r7=363(x2), r8=73(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 125
LDI r1, 146
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 6
LDI r6, 200
LDI r7, 363
LDI r8, 73
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
