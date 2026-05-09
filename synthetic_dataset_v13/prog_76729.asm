; DESCRIPTION: Composite: Renders a orange box of size 88x103 starting at (177, 83) then Sets a single yellow pixel at (303, 206) then Draws a cyan line from (246, 181) to (217, 178).
; PLAN: r0=177(x), r1=83(y), r2=88(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=303(x), r6=206(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=246(x1), r11=181(y1), r12=217(x2), r13=178(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 177
LDI r1, 83
LDI r2, 88
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 206
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 246
LDI r11, 181
LDI r12, 217
LDI r13, 178
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
