; DESCRIPTION: Composite: Places a orange dot at position (118, 22) then Draws a cyan circle centered at (104, 165) with radius 68 then Draws a green line from (366, 166) to (59, 113).
; PLAN: r0=118(x), r1=22(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=104(x), r6=165(y), r7=68(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=366(x1), r11=166(y1), r12=59(x2), r13=113(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 118
LDI r1, 22
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 104
LDI r6, 165
LDI r7, 68
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 366
LDI r11, 166
LDI r12, 59
LDI r13, 113
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
