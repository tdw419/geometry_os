; DESCRIPTION: Composite: Draws a red line from (473, 150) to (107, 1) then Places a red circle of radius 38 at center (143, 112).
; PLAN: r0=473(x1), r1=150(y1), r2=107(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=143(x), r6=112(y), r7=38(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 473
LDI r1, 150
LDI r2, 107
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 112
LDI r7, 38
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
