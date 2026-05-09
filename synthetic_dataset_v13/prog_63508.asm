; DESCRIPTION: Composite: Renders a magenta disk with center (338, 172) and radius 16 then Places a red dot at position (79, 124) then Places a red line segment connecting (53, 16) to (308, 185).
; PLAN: r0=338(x), r1=172(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=79(x), r6=124(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=53(x1), r11=16(y1), r12=308(x2), r13=185(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 338
LDI r1, 172
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 79
LDI r6, 124
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 53
LDI r11, 16
LDI r12, 308
LDI r13, 185
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
