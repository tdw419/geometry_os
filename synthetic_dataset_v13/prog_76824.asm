; DESCRIPTION: Composite: Places a magenta 102x17 rectangle at position (133, 77) then Places a black dot at position (35, 80) then Draws a white line from (34, 54) to (509, 62).
; PLAN: r0=133(x), r1=77(y), r2=102(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=35(x), r6=80(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=34(x1), r11=54(y1), r12=509(x2), r13=62(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 133
LDI r1, 77
LDI r2, 102
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 80
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 34
LDI r11, 54
LDI r12, 509
LDI r13, 62
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
