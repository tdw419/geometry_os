; DESCRIPTION: Composite: Sets a single white pixel at (261, 166) then Draws a black line from (330, 254) to (70, 236) then Places a white 51x31 rectangle at position (129, 72).
; PLAN: r0=261(x), r1=166(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=330(x1), r6=254(y1), r7=70(x2), r8=236(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=129(x), r11=72(y), r12=51(width), r13=31(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 261
LDI r1, 166
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 330
LDI r6, 254
LDI r7, 70
LDI r8, 236
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 129
LDI r11, 72
LDI r12, 51
LDI r13, 31
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
