; DESCRIPTION: Composite: Draws a purple rectangle at (124, 3) with width 57 and height 85 then Sets a single purple pixel at (127, 175) then Places a magenta line segment connecting (180, 97) to (313, 59).
; PLAN: r0=124(x), r1=3(y), r2=57(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=127(x), r6=175(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=180(x1), r11=97(y1), r12=313(x2), r13=59(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 124
LDI r1, 3
LDI r2, 57
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 175
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 180
LDI r11, 97
LDI r12, 313
LDI r13, 59
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
