; DESCRIPTION: Composite: Renders a magenta box of size 114x67 starting at (233, 127) then Renders a black line between points (488, 147) and (364, 79).
; PLAN: r0=233(x), r1=127(y), r2=114(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=488(x1), r6=147(y1), r7=364(x2), r8=79(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 233
LDI r1, 127
LDI r2, 114
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 488
LDI r6, 147
LDI r7, 364
LDI r8, 79
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
