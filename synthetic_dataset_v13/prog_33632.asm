; DESCRIPTION: Composite: Places a red circle of radius 29 at center (202, 206) then Renders a black box of size 20x115 starting at (423, 90) then Renders a black line between points (265, 233) and (293, 81).
; PLAN: r0=202(x), r1=206(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=423(x), r6=90(y), r7=20(width), r8=115(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=265(x1), r11=233(y1), r12=293(x2), r13=81(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 202
LDI r1, 206
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 423
LDI r6, 90
LDI r7, 20
LDI r8, 115
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 233
LDI r12, 293
LDI r13, 81
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
