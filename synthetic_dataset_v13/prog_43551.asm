; DESCRIPTION: Composite: Places a purple 108x11 rectangle at position (27, 219) then Sets a single yellow pixel at (224, 66) then Renders a magenta line between points (209, 155) and (120, 86).
; PLAN: r0=27(x), r1=219(y), r2=108(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=224(x), r6=66(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=209(x1), r11=155(y1), r12=120(x2), r13=86(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 27
LDI r1, 219
LDI r2, 108
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 66
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 209
LDI r11, 155
LDI r12, 120
LDI r13, 86
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
