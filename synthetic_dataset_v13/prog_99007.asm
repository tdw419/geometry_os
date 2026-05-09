; DESCRIPTION: Composite: Renders a green disk with center (202, 195) and radius 27 then Draws a purple rectangle at (236, 214) with width 31 and height 26 then Draws a cyan line from (87, 153) to (56, 212).
; PLAN: r0=202(x), r1=195(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=236(x), r6=214(y), r7=31(width), r8=26(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=87(x1), r11=153(y1), r12=56(x2), r13=212(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 202
LDI r1, 195
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 236
LDI r6, 214
LDI r7, 31
LDI r8, 26
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 87
LDI r11, 153
LDI r12, 56
LDI r13, 212
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
