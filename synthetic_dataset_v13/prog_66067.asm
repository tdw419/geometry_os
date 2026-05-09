; DESCRIPTION: Composite: Creates a orange circular shape at (277, 131) with radius 36 then Places a black dot at position (226, 74) then Places a orange line segment connecting (418, 176) to (210, 10).
; PLAN: r0=277(x), r1=131(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x), r6=74(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=418(x1), r11=176(y1), r12=210(x2), r13=10(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 277
LDI r1, 131
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 74
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 418
LDI r11, 176
LDI r12, 210
LDI r13, 10
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
