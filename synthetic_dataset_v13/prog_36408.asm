; DESCRIPTION: Composite: Places a red dot at position (329, 205) then Places a red circle of radius 14 at center (459, 148) then Draws a white line from (115, 165) to (290, 115).
; PLAN: r0=329(x), r1=205(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=459(x), r6=148(y), r7=14(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=115(x1), r11=165(y1), r12=290(x2), r13=115(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 205
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 459
LDI r6, 148
LDI r7, 14
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 115
LDI r11, 165
LDI r12, 290
LDI r13, 115
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
