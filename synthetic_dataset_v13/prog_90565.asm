; DESCRIPTION: Composite: Creates a yellow rectangular region at (272, 222) spanning 50 by 20 pixels then Places a red dot at position (427, 165) then Draws a white line from (32, 33) to (277, 12).
; PLAN: r0=272(x), r1=222(y), r2=50(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=427(x), r6=165(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=32(x1), r11=33(y1), r12=277(x2), r13=12(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 222
LDI r2, 50
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 165
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 32
LDI r11, 33
LDI r12, 277
LDI r13, 12
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
