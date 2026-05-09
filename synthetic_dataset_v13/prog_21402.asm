; DESCRIPTION: Composite: Renders a yellow disk with center (428, 62) and radius 19 then Draws a magenta line from (11, 217) to (229, 44) then Renders a cyan box of size 96x56 starting at (87, 31).
; PLAN: r0=428(x), r1=62(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=11(x1), r6=217(y1), r7=229(x2), r8=44(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=87(x), r11=31(y), r12=96(width), r13=56(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 428
LDI r1, 62
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 11
LDI r6, 217
LDI r7, 229
LDI r8, 44
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 87
LDI r11, 31
LDI r12, 96
LDI r13, 56
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
