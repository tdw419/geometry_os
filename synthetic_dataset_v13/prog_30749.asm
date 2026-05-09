; DESCRIPTION: Composite: Places a magenta line segment connecting (290, 212) to (240, 214) then Places a blue dot at position (253, 224) then Places a yellow 46x102 rectangle at position (337, 4).
; PLAN: r0=290(x1), r1=212(y1), r2=240(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=224(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=337(x), r11=4(y), r12=46(width), r13=102(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 290
LDI r1, 212
LDI r2, 240
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 224
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 337
LDI r11, 4
LDI r12, 46
LDI r13, 102
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
