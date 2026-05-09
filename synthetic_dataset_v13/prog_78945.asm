; DESCRIPTION: Composite: Renders a blue line between points (93, 248) and (218, 202) then Places a black dot at position (313, 208) then Renders a cyan box of size 15x83 starting at (485, 77).
; PLAN: r0=93(x1), r1=248(y1), r2=218(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=313(x), r6=208(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=485(x), r11=77(y), r12=15(width), r13=83(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 93
LDI r1, 248
LDI r2, 218
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 208
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 485
LDI r11, 77
LDI r12, 15
LDI r13, 83
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
