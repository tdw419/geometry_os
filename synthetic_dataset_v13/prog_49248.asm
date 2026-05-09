; DESCRIPTION: Composite: Places a white circle of radius 38 at center (324, 69) then Sets a single magenta pixel at (161, 203) then Draws a magenta line from (243, 150) to (231, 252).
; PLAN: r0=324(x), r1=69(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=161(x), r6=203(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=243(x1), r11=150(y1), r12=231(x2), r13=252(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 324
LDI r1, 69
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 161
LDI r6, 203
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 243
LDI r11, 150
LDI r12, 231
LDI r13, 252
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
