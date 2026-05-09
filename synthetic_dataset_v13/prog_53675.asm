; DESCRIPTION: Composite: Sets a single red pixel at (455, 204) then Renders a green box of size 71x94 starting at (366, 127) then Places a blue line segment connecting (355, 89) to (157, 182).
; PLAN: r0=455(x), r1=204(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=366(x), r6=127(y), r7=71(width), r8=94(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=355(x1), r11=89(y1), r12=157(x2), r13=182(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 455
LDI r1, 204
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 366
LDI r6, 127
LDI r7, 71
LDI r8, 94
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 355
LDI r11, 89
LDI r12, 157
LDI r13, 182
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
