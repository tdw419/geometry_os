; DESCRIPTION: Composite: Draws a white line from (141, 210) to (381, 129) then Places a white dot at position (348, 24) then Places a blue 31x95 rectangle at position (478, 16).
; PLAN: r0=141(x1), r1=210(y1), r2=381(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=348(x), r6=24(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=478(x), r11=16(y), r12=31(width), r13=95(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 141
LDI r1, 210
LDI r2, 381
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 24
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 478
LDI r11, 16
LDI r12, 31
LDI r13, 95
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
