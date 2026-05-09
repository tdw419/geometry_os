; DESCRIPTION: Composite: Renders a cyan box of size 15x34 starting at (391, 148) then Places a green dot at position (244, 221) then Draws a purple line from (227, 222) to (435, 248).
; PLAN: r0=391(x), r1=148(y), r2=15(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=244(x), r6=221(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=227(x1), r11=222(y1), r12=435(x2), r13=248(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 391
LDI r1, 148
LDI r2, 15
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 221
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 227
LDI r11, 222
LDI r12, 435
LDI r13, 248
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
