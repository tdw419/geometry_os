; DESCRIPTION: Composite: Creates a orange rectangular region at (220, 52) spanning 105 by 94 pixels then Sets a single purple pixel at (19, 130) then Draws a magenta line from (152, 229) to (485, 144).
; PLAN: r0=220(x), r1=52(y), r2=105(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=19(x), r6=130(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=152(x1), r11=229(y1), r12=485(x2), r13=144(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 220
LDI r1, 52
LDI r2, 105
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 130
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 152
LDI r11, 229
LDI r12, 485
LDI r13, 144
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
