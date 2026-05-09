; DESCRIPTION: Composite: Draws a blue line from (204, 151) to (131, 20) then Sets a single purple pixel at (433, 103) then Places a red circle of radius 40 at center (238, 113).
; PLAN: r0=204(x1), r1=151(y1), r2=131(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=433(x), r6=103(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=238(x), r11=113(y), r12=40(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 204
LDI r1, 151
LDI r2, 131
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 103
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 238
LDI r11, 113
LDI r12, 40
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
