; DESCRIPTION: Composite: Places a blue circle of radius 29 at center (49, 120) then Draws a black line from (30, 127) to (256, 133) then Places a magenta dot at position (72, 252).
; PLAN: r0=49(x), r1=120(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=30(x1), r6=127(y1), r7=256(x2), r8=133(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=72(x), r11=252(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 49
LDI r1, 120
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 30
LDI r6, 127
LDI r7, 256
LDI r8, 133
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 72
LDI r11, 252
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
