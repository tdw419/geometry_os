; DESCRIPTION: Composite: Draws a white line from (355, 100) to (488, 7) then Places a white circle of radius 57 at center (145, 173).
; PLAN: r0=355(x1), r1=100(y1), r2=488(x2), r3=7(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=145(x), r6=173(y), r7=57(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 355
LDI r1, 100
LDI r2, 488
LDI r3, 7
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 173
LDI r7, 57
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
