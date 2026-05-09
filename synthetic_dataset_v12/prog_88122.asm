; DESCRIPTION: Composite: Places a magenta line segment connecting (473, 113) to (336, 72) then Renders a blue box of size 84x25 starting at (63, 211) then Places a cyan circle of radius 44 at center (446, 118).
; PLAN: r0=473(x1), r1=113(y1), r2=336(x2), r3=72(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=63(x), r6=211(y), r7=84(width), r8=25(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=446(x), r11=118(y), r12=44(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 473
LDI r1, 113
LDI r2, 336
LDI r3, 72
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 211
LDI r7, 84
LDI r8, 25
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 446
LDI r11, 118
LDI r12, 44
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
