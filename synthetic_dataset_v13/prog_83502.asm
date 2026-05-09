; DESCRIPTION: Composite: Renders a orange box of size 107x23 starting at (321, 147) then Places a cyan dot at position (69, 131) then Draws a orange line from (419, 140) to (282, 222).
; PLAN: r0=321(x), r1=147(y), r2=107(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=69(x), r6=131(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=419(x1), r11=140(y1), r12=282(x2), r13=222(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 321
LDI r1, 147
LDI r2, 107
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 131
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 419
LDI r11, 140
LDI r12, 282
LDI r13, 222
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
