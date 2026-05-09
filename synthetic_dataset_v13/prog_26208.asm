; DESCRIPTION: Composite: Places a orange 75x28 rectangle at position (297, 131) then Sets a single red pixel at (174, 105) then Renders a yellow line between points (504, 187) and (403, 98).
; PLAN: r0=297(x), r1=131(y), r2=75(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=174(x), r6=105(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=504(x1), r11=187(y1), r12=403(x2), r13=98(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 297
LDI r1, 131
LDI r2, 75
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 105
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 504
LDI r11, 187
LDI r12, 403
LDI r13, 98
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
