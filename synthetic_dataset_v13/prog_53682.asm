; DESCRIPTION: Composite: Creates a white rectangular region at (63, 71) spanning 10 by 100 pixels then Places a red dot at position (80, 122) then Renders a black line between points (53, 226) and (454, 200).
; PLAN: r0=63(x), r1=71(y), r2=10(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=80(x), r6=122(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=53(x1), r11=226(y1), r12=454(x2), r13=200(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 63
LDI r1, 71
LDI r2, 10
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 122
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 53
LDI r11, 226
LDI r12, 454
LDI r13, 200
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
