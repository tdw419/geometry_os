; DESCRIPTION: Composite: Renders a yellow box of size 82x108 starting at (223, 19) then Sets a single white pixel at (100, 115) then Draws a magenta line from (213, 31) to (175, 200).
; PLAN: r0=223(x), r1=19(y), r2=82(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=100(x), r6=115(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=213(x1), r11=31(y1), r12=175(x2), r13=200(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 223
LDI r1, 19
LDI r2, 82
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 115
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 213
LDI r11, 31
LDI r12, 175
LDI r13, 200
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
