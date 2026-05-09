; DESCRIPTION: Composite: Places a black circle of radius 68 at center (359, 78) then Draws a red line from (502, 183) to (221, 33).
; PLAN: r0=359(x), r1=78(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=502(x1), r6=183(y1), r7=221(x2), r8=33(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 78
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 502
LDI r6, 183
LDI r7, 221
LDI r8, 33
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
