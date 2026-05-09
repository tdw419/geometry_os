; DESCRIPTION: Composite: Draws a blue rectangle at (233, 33) with width 114 and height 23 then Places a purple dot at position (23, 51) then Draws a red line from (320, 200) to (73, 187).
; PLAN: r0=233(x), r1=33(y), r2=114(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=23(x), r6=51(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=320(x1), r11=200(y1), r12=73(x2), r13=187(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 233
LDI r1, 33
LDI r2, 114
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 51
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 320
LDI r11, 200
LDI r12, 73
LDI r13, 187
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
