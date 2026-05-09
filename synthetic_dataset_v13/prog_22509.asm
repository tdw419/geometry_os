; DESCRIPTION: Composite: Draws a blue line from (122, 226) to (214, 152) then Creates a black circular shape at (337, 97) with radius 67.
; PLAN: r0=122(x1), r1=226(y1), r2=214(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=337(x), r6=97(y), r7=67(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 122
LDI r1, 226
LDI r2, 214
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 97
LDI r7, 67
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
