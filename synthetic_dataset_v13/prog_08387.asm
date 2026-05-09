; DESCRIPTION: Composite: Places a blue circle of radius 50 at center (252, 180) then Places a magenta dot at position (107, 43) then Draws a green line from (220, 137) to (148, 190).
; PLAN: r0=252(x), r1=180(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=107(x), r6=43(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=220(x1), r11=137(y1), r12=148(x2), r13=190(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 252
LDI r1, 180
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 107
LDI r6, 43
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 220
LDI r11, 137
LDI r12, 148
LDI r13, 190
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
