; DESCRIPTION: Composite: Draws a blue rectangle at (174, 196) with width 117 and height 11 then Sets a single purple pixel at (420, 127) then Renders a white line between points (206, 61) and (1, 71).
; PLAN: r0=174(x), r1=196(y), r2=117(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=420(x), r6=127(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=206(x1), r11=61(y1), r12=1(x2), r13=71(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 174
LDI r1, 196
LDI r2, 117
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 127
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 206
LDI r11, 61
LDI r12, 1
LDI r13, 71
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
