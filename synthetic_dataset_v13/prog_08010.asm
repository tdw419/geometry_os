; DESCRIPTION: Composite: Places a magenta dot at position (86, 12) then Places a yellow 39x46 rectangle at position (74, 148) then Places a yellow line segment connecting (325, 20) to (40, 161).
; PLAN: r0=86(x), r1=12(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=74(x), r6=148(y), r7=39(width), r8=46(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=325(x1), r11=20(y1), r12=40(x2), r13=161(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 86
LDI r1, 12
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 74
LDI r6, 148
LDI r7, 39
LDI r8, 46
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 325
LDI r11, 20
LDI r12, 40
LDI r13, 161
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
