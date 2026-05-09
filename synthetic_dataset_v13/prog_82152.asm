; DESCRIPTION: Composite: Sets a single green pixel at (189, 118) then Places a black 110x40 rectangle at position (268, 166) then Draws a cyan line from (270, 45) to (191, 250).
; PLAN: r0=189(x), r1=118(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=268(x), r6=166(y), r7=110(width), r8=40(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=270(x1), r11=45(y1), r12=191(x2), r13=250(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 189
LDI r1, 118
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 268
LDI r6, 166
LDI r7, 110
LDI r8, 40
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 270
LDI r11, 45
LDI r12, 191
LDI r13, 250
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
