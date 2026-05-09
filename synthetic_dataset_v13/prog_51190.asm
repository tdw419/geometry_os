; DESCRIPTION: Composite: Places a red dot at position (371, 13) then Places a magenta circle of radius 55 at center (406, 67) then Draws a blue line from (357, 38) to (121, 120).
; PLAN: r0=371(x), r1=13(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=406(x), r6=67(y), r7=55(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=357(x1), r11=38(y1), r12=121(x2), r13=120(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 371
LDI r1, 13
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 406
LDI r6, 67
LDI r7, 55
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 357
LDI r11, 38
LDI r12, 121
LDI r13, 120
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
