; DESCRIPTION: Composite: Places a white 25x52 rectangle at position (269, 150) then Places a magenta dot at position (247, 175) then Draws a black line from (147, 131) to (462, 29).
; PLAN: r0=269(x), r1=150(y), r2=25(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=247(x), r6=175(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=147(x1), r11=131(y1), r12=462(x2), r13=29(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 269
LDI r1, 150
LDI r2, 25
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 175
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 147
LDI r11, 131
LDI r12, 462
LDI r13, 29
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
