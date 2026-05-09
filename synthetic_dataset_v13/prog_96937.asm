; DESCRIPTION: Composite: Draws a red line from (165, 44) to (301, 133) then Places a purple circle of radius 67 at center (327, 135).
; PLAN: r0=165(x1), r1=44(y1), r2=301(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=327(x), r6=135(y), r7=67(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 165
LDI r1, 44
LDI r2, 301
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 135
LDI r7, 67
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
