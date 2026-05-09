; DESCRIPTION: Composite: Draws a purple line from (200, 250) to (82, 46) then Places a white dot at position (88, 194) then Renders a green box of size 119x115 starting at (256, 109).
; PLAN: r0=200(x1), r1=250(y1), r2=82(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=88(x), r6=194(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=256(x), r11=109(y), r12=119(width), r13=115(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 200
LDI r1, 250
LDI r2, 82
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 194
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 256
LDI r11, 109
LDI r12, 119
LDI r13, 115
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
