; DESCRIPTION: Composite: Draws a white line from (90, 171) to (289, 206) then Places a white circle of radius 19 at center (484, 134).
; PLAN: r0=90(x1), r1=171(y1), r2=289(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=484(x), r6=134(y), r7=19(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 90
LDI r1, 171
LDI r2, 289
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 484
LDI r6, 134
LDI r7, 19
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
