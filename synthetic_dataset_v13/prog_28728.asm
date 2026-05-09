; DESCRIPTION: Composite: Places a yellow dot at position (256, 229) then Creates a yellow circular shape at (252, 78) with radius 32 then Draws a magenta line from (209, 216) to (429, 180).
; PLAN: r0=256(x), r1=229(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=252(x), r6=78(y), r7=32(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=209(x1), r11=216(y1), r12=429(x2), r13=180(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 256
LDI r1, 229
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 252
LDI r6, 78
LDI r7, 32
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 209
LDI r11, 216
LDI r12, 429
LDI r13, 180
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
