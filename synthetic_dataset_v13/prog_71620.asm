; DESCRIPTION: Composite: Places a yellow 56x117 rectangle at position (17, 69) then Sets a single white pixel at (69, 136) then Places a red line segment connecting (207, 84) to (290, 210).
; PLAN: r0=17(x), r1=69(y), r2=56(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=69(x), r6=136(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=207(x1), r11=84(y1), r12=290(x2), r13=210(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 17
LDI r1, 69
LDI r2, 56
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 136
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 207
LDI r11, 84
LDI r12, 290
LDI r13, 210
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
