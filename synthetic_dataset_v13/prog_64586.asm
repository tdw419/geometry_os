; DESCRIPTION: Composite: Draws a red line from (5, 103) to (230, 65) then Places a white circle of radius 29 at center (480, 217).
; PLAN: r0=5(x1), r1=103(y1), r2=230(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=480(x), r6=217(y), r7=29(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 5
LDI r1, 103
LDI r2, 230
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 480
LDI r6, 217
LDI r7, 29
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
