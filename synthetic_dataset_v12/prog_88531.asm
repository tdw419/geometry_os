; DESCRIPTION: Composite: Draws a white rectangle at (272, 167) with width 75 and height 36 then Sets a single white pixel at (305, 222) then Renders a black line between points (256, 231) and (313, 132).
; PLAN: r0=272(x), r1=167(y), r2=75(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=305(x), r6=222(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=256(x1), r11=231(y1), r12=313(x2), r13=132(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 167
LDI r2, 75
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 222
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 256
LDI r11, 231
LDI r12, 313
LDI r13, 132
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
