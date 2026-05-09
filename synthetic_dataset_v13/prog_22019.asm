; DESCRIPTION: Composite: Places a red dot at position (379, 68) then Draws a black rectangle at (261, 103) with width 18 and height 64 then Renders a orange line between points (305, 51) and (272, 176).
; PLAN: r0=379(x), r1=68(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=261(x), r6=103(y), r7=18(width), r8=64(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=305(x1), r11=51(y1), r12=272(x2), r13=176(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 379
LDI r1, 68
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 261
LDI r6, 103
LDI r7, 18
LDI r8, 64
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 51
LDI r12, 272
LDI r13, 176
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
