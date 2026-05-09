; DESCRIPTION: Composite: Renders a green box of size 78x120 starting at (203, 59) then Sets a single white pixel at (171, 73) then Places a green line segment connecting (377, 81) to (149, 13).
; PLAN: r0=203(x), r1=59(y), r2=78(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=171(x), r6=73(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=377(x1), r11=81(y1), r12=149(x2), r13=13(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 203
LDI r1, 59
LDI r2, 78
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 73
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 377
LDI r11, 81
LDI r12, 149
LDI r13, 13
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
