; DESCRIPTION: Composite: Draws a green line from (159, 214) to (456, 34) then Places a yellow dot at position (111, 171) then Places a purple 73x33 rectangle at position (430, 126).
; PLAN: r0=159(x1), r1=214(y1), r2=456(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=111(x), r6=171(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=430(x), r11=126(y), r12=73(width), r13=33(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 159
LDI r1, 214
LDI r2, 456
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 171
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 430
LDI r11, 126
LDI r12, 73
LDI r13, 33
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
