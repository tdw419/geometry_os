; DESCRIPTION: Composite: Draws a cyan line from (15, 143) to (362, 120) then Places a white circle of radius 63 at center (303, 134) then Renders a black box of size 19x17 starting at (371, 112).
; PLAN: r0=15(x1), r1=143(y1), r2=362(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=134(y), r7=63(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=371(x), r11=112(y), r12=19(width), r13=17(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 15
LDI r1, 143
LDI r2, 362
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 134
LDI r7, 63
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 371
LDI r11, 112
LDI r12, 19
LDI r13, 17
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
