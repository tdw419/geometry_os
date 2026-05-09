; DESCRIPTION: Composite: Sets a single red pixel at (142, 243) then Draws a red rectangle at (177, 176) with width 17 and height 71 then Draws a blue line from (319, 196) to (70, 73).
; PLAN: r0=142(x), r1=243(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=177(x), r6=176(y), r7=17(width), r8=71(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=319(x1), r11=196(y1), r12=70(x2), r13=73(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 142
LDI r1, 243
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 177
LDI r6, 176
LDI r7, 17
LDI r8, 71
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 319
LDI r11, 196
LDI r12, 70
LDI r13, 73
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
