; DESCRIPTION: Composite: Draws a blue line from (409, 121) to (102, 74) then Draws a black circle centered at (193, 95) with radius 65 then Places a green 107x51 rectangle at position (141, 89).
; PLAN: r0=409(x1), r1=121(y1), r2=102(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=193(x), r6=95(y), r7=65(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=141(x), r11=89(y), r12=107(width), r13=51(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 121
LDI r2, 102
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 95
LDI r7, 65
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 141
LDI r11, 89
LDI r12, 107
LDI r13, 51
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
