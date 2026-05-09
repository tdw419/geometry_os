; DESCRIPTION: Composite: Sets a single blue pixel at (84, 66) then Places a purple 84x19 rectangle at position (74, 140) then Draws a green line from (180, 57) to (7, 222).
; PLAN: r0=84(x), r1=66(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=74(x), r6=140(y), r7=84(width), r8=19(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=180(x1), r11=57(y1), r12=7(x2), r13=222(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 84
LDI r1, 66
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 74
LDI r6, 140
LDI r7, 84
LDI r8, 19
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 180
LDI r11, 57
LDI r12, 7
LDI r13, 222
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
