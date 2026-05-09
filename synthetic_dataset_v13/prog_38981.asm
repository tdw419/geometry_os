; DESCRIPTION: Composite: Draws a magenta circle centered at (276, 125) with radius 78 then Places a cyan dot at position (56, 62) then Draws a blue line from (380, 242) to (101, 157).
; PLAN: r0=276(x), r1=125(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=56(x), r6=62(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=380(x1), r11=242(y1), r12=101(x2), r13=157(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 276
LDI r1, 125
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 56
LDI r6, 62
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 380
LDI r11, 242
LDI r12, 101
LDI r13, 157
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
