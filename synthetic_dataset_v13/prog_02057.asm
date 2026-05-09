; DESCRIPTION: Composite: Sets a single magenta pixel at (385, 163) then Draws a magenta line from (122, 58) to (337, 187) then Draws a cyan rectangle at (200, 103) with width 120 and height 94.
; PLAN: r0=385(x), r1=163(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=122(x1), r6=58(y1), r7=337(x2), r8=187(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=200(x), r11=103(y), r12=120(width), r13=94(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 163
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 122
LDI r6, 58
LDI r7, 337
LDI r8, 187
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 200
LDI r11, 103
LDI r12, 120
LDI r13, 94
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
