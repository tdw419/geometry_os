; DESCRIPTION: Composite: Draws a magenta circle centered at (188, 74) with radius 49 then Places a red dot at position (15, 131) then Renders a yellow line between points (28, 242) and (77, 238).
; PLAN: r0=188(x), r1=74(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x), r6=131(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=28(x1), r11=242(y1), r12=77(x2), r13=238(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 188
LDI r1, 74
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 131
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 28
LDI r11, 242
LDI r12, 77
LDI r13, 238
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
