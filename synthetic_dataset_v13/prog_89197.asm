; DESCRIPTION: Composite: Places a purple 70x10 rectangle at position (127, 216) then Draws a yellow circle centered at (173, 186) with radius 33 then Draws a red line from (20, 152) to (209, 7).
; PLAN: r0=127(x), r1=216(y), r2=70(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=173(x), r6=186(y), r7=33(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=20(x1), r11=152(y1), r12=209(x2), r13=7(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 216
LDI r2, 70
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 186
LDI r7, 33
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 20
LDI r11, 152
LDI r12, 209
LDI r13, 7
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
