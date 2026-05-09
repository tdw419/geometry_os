; DESCRIPTION: Composite: Creates a orange circular shape at (183, 134) with radius 77 then Renders a white line between points (165, 206) and (277, 7).
; PLAN: r0=183(x), r1=134(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=165(x1), r6=206(y1), r7=277(x2), r8=7(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 183
LDI r1, 134
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 165
LDI r6, 206
LDI r7, 277
LDI r8, 7
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
