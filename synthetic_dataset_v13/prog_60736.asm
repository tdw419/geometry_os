; DESCRIPTION: Composite: Places a cyan dot at position (219, 11) then Draws a green line from (369, 194) to (461, 73) then Renders a yellow box of size 16x81 starting at (437, 22).
; PLAN: r0=219(x), r1=11(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=369(x1), r6=194(y1), r7=461(x2), r8=73(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=437(x), r11=22(y), r12=16(width), r13=81(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 219
LDI r1, 11
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 369
LDI r6, 194
LDI r7, 461
LDI r8, 73
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 437
LDI r11, 22
LDI r12, 16
LDI r13, 81
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
