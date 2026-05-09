; DESCRIPTION: Composite: Renders a white line between points (161, 24) and (408, 190) then Places a red dot at position (470, 88) then Places a red 73x113 rectangle at position (169, 86).
; PLAN: r0=161(x1), r1=24(y1), r2=408(x2), r3=190(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=470(x), r6=88(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=169(x), r11=86(y), r12=73(width), r13=113(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 161
LDI r1, 24
LDI r2, 408
LDI r3, 190
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 88
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 169
LDI r11, 86
LDI r12, 73
LDI r13, 113
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
