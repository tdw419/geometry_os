; DESCRIPTION: Composite: Sets a single blue pixel at (424, 203) then Draws a blue rectangle at (122, 117) with width 38 and height 71 then Draws a blue line from (250, 208) to (487, 243).
; PLAN: r0=424(x), r1=203(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=122(x), r6=117(y), r7=38(width), r8=71(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=250(x1), r11=208(y1), r12=487(x2), r13=243(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 203
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 122
LDI r6, 117
LDI r7, 38
LDI r8, 71
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 250
LDI r11, 208
LDI r12, 487
LDI r13, 243
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
