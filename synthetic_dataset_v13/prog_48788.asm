; DESCRIPTION: Composite: Renders a yellow box of size 59x75 starting at (313, 148) then Places a yellow dot at position (400, 218) then Renders a magenta line between points (39, 248) and (366, 202).
; PLAN: r0=313(x), r1=148(y), r2=59(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x), r6=218(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=39(x1), r11=248(y1), r12=366(x2), r13=202(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 148
LDI r2, 59
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 218
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 39
LDI r11, 248
LDI r12, 366
LDI r13, 202
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
