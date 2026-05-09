; DESCRIPTION: Composite: Places a magenta circle of radius 37 at center (227, 188) then Draws a purple line from (305, 168) to (369, 59) then Places a red dot at position (151, 220).
; PLAN: r0=227(x), r1=188(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x1), r6=168(y1), r7=369(x2), r8=59(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=151(x), r11=220(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 227
LDI r1, 188
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 168
LDI r7, 369
LDI r8, 59
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 151
LDI r11, 220
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
