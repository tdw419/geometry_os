; DESCRIPTION: Composite: Renders a black line between points (493, 11) and (501, 174) then Places a purple dot at position (502, 102) then Renders a purple box of size 59x15 starting at (146, 116).
; PLAN: r0=493(x1), r1=11(y1), r2=501(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=502(x), r6=102(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=146(x), r11=116(y), r12=59(width), r13=15(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 493
LDI r1, 11
LDI r2, 501
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 502
LDI r6, 102
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 146
LDI r11, 116
LDI r12, 59
LDI r13, 15
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
