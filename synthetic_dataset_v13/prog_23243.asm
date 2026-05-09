; DESCRIPTION: Composite: Renders a magenta disk with center (321, 188) and radius 55 then Draws a cyan line from (402, 24) to (337, 92) then Renders a purple box of size 79x83 starting at (105, 167).
; PLAN: r0=321(x), r1=188(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=402(x1), r6=24(y1), r7=337(x2), r8=92(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=105(x), r11=167(y), r12=79(width), r13=83(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 321
LDI r1, 188
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 402
LDI r6, 24
LDI r7, 337
LDI r8, 92
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 105
LDI r11, 167
LDI r12, 79
LDI r13, 83
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
