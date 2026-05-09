; DESCRIPTION: Composite: Creates a orange circular shape at (476, 200) with radius 28 then Places a red dot at position (291, 11) then Draws a white line from (297, 74) to (13, 27).
; PLAN: r0=476(x), r1=200(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=291(x), r6=11(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=297(x1), r11=74(y1), r12=13(x2), r13=27(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 476
LDI r1, 200
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 291
LDI r6, 11
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 297
LDI r11, 74
LDI r12, 13
LDI r13, 27
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
