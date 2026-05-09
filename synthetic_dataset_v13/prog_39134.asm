; DESCRIPTION: Composite: Places a red dot at position (6, 61) then Places a white circle of radius 67 at center (400, 77) then Draws a blue line from (113, 198) to (426, 250).
; PLAN: r0=6(x), r1=61(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=400(x), r6=77(y), r7=67(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=113(x1), r11=198(y1), r12=426(x2), r13=250(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 6
LDI r1, 61
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 400
LDI r6, 77
LDI r7, 67
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 113
LDI r11, 198
LDI r12, 426
LDI r13, 250
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
