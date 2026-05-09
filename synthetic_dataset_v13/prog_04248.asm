; DESCRIPTION: Composite: Creates a green circular shape at (425, 145) with radius 77 then Draws a blue line from (146, 204) to (411, 78).
; PLAN: r0=425(x), r1=145(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=146(x1), r6=204(y1), r7=411(x2), r8=78(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 425
LDI r1, 145
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 146
LDI r6, 204
LDI r7, 411
LDI r8, 78
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
