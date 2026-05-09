; DESCRIPTION: Composite: Places a magenta circle of radius 34 at center (117, 97) then Sets a single white pixel at (68, 55) then Renders a blue line between points (425, 39) and (242, 89).
; PLAN: r0=117(x), r1=97(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x), r6=55(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=425(x1), r11=39(y1), r12=242(x2), r13=89(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 117
LDI r1, 97
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 55
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 425
LDI r11, 39
LDI r12, 242
LDI r13, 89
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
