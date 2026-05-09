; DESCRIPTION: Composite: Creates a orange rectangular region at (255, 19) spanning 100 by 22 pixels then Places a blue circle of radius 25 at center (112, 98) then Draws a cyan line from (216, 66) to (277, 94).
; PLAN: r0=255(x), r1=19(y), r2=100(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=112(x), r6=98(y), r7=25(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=216(x1), r11=66(y1), r12=277(x2), r13=94(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 255
LDI r1, 19
LDI r2, 100
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 98
LDI r7, 25
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 216
LDI r11, 66
LDI r12, 277
LDI r13, 94
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
