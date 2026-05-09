; DESCRIPTION: Composite: Draws a yellow line from (371, 141) to (310, 103) then Sets a single white pixel at (369, 164) then Creates a blue rectangular region at (425, 28) spanning 16 by 51 pixels.
; PLAN: r0=371(x1), r1=141(y1), r2=310(x2), r3=103(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=164(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=425(x), r11=28(y), r12=16(width), r13=51(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 371
LDI r1, 141
LDI r2, 310
LDI r3, 103
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 164
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 425
LDI r11, 28
LDI r12, 16
LDI r13, 51
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
