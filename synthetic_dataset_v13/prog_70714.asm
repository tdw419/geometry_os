; DESCRIPTION: Composite: Draws a white line from (82, 178) to (236, 38) then Renders a magenta disk with center (362, 101) and radius 74 then Renders a purple box of size 67x82 starting at (124, 145).
; PLAN: r0=82(x1), r1=178(y1), r2=236(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=362(x), r6=101(y), r7=74(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=124(x), r11=145(y), r12=67(width), r13=82(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 82
LDI r1, 178
LDI r2, 236
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 101
LDI r7, 74
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 124
LDI r11, 145
LDI r12, 67
LDI r13, 82
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
