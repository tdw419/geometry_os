; DESCRIPTION: Composite: Draws a white line from (43, 154) to (398, 38) then Sets a single red pixel at (68, 33) then Places a green 117x51 rectangle at position (165, 17).
; PLAN: r0=43(x1), r1=154(y1), r2=398(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=68(x), r6=33(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=165(x), r11=17(y), r12=117(width), r13=51(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 43
LDI r1, 154
LDI r2, 398
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 33
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 165
LDI r11, 17
LDI r12, 117
LDI r13, 51
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
