; DESCRIPTION: Composite: Draws a yellow line from (20, 236) to (170, 187) then Draws a black rectangle at (38, 91) with width 92 and height 92.
; PLAN: r0=20(x1), r1=236(y1), r2=170(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=38(x), r6=91(y), r7=92(width), r8=92(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 20
LDI r1, 236
LDI r2, 170
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 91
LDI r7, 92
LDI r8, 92
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
