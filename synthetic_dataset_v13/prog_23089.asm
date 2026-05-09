; DESCRIPTION: Composite: Renders a magenta box of size 17x22 starting at (280, 86) then Places a yellow line segment connecting (235, 227) to (298, 41).
; PLAN: r0=280(x), r1=86(y), r2=17(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=235(x1), r6=227(y1), r7=298(x2), r8=41(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 86
LDI r2, 17
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 227
LDI r7, 298
LDI r8, 41
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
