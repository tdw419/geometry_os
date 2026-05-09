; DESCRIPTION: Composite: Draws a green line from (315, 21) to (275, 122) then Sets a single white pixel at (121, 244) then Renders a orange box of size 84x29 starting at (176, 95).
; PLAN: r0=315(x1), r1=21(y1), r2=275(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=121(x), r6=244(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=176(x), r11=95(y), r12=84(width), r13=29(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 315
LDI r1, 21
LDI r2, 275
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 244
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 176
LDI r11, 95
LDI r12, 84
LDI r13, 29
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
