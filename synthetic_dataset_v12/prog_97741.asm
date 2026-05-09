; DESCRIPTION: Composite: Renders a magenta disk with center (387, 190) and radius 65 then Draws a cyan rectangle at (357, 63) with width 31 and height 67 then Places a purple line segment connecting (247, 124) to (219, 41).
; PLAN: r0=387(x), r1=190(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x), r6=63(y), r7=31(width), r8=67(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=247(x1), r11=124(y1), r12=219(x2), r13=41(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 387
LDI r1, 190
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 63
LDI r7, 31
LDI r8, 67
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 247
LDI r11, 124
LDI r12, 219
LDI r13, 41
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
