; DESCRIPTION: Composite: Draws a magenta circle centered at (265, 181) with radius 58 then Places a magenta dot at position (486, 50) then Draws a green line from (133, 65) to (24, 190).
; PLAN: r0=265(x), r1=181(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=486(x), r6=50(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=133(x1), r11=65(y1), r12=24(x2), r13=190(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 265
LDI r1, 181
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 486
LDI r6, 50
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 133
LDI r11, 65
LDI r12, 24
LDI r13, 190
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
