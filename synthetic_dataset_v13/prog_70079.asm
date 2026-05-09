; DESCRIPTION: Composite: Draws a green line from (28, 217) to (47, 2) then Places a yellow circle of radius 79 at center (140, 173).
; PLAN: r0=28(x1), r1=217(y1), r2=47(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=140(x), r6=173(y), r7=79(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 28
LDI r1, 217
LDI r2, 47
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 173
LDI r7, 79
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
