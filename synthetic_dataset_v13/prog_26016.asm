; DESCRIPTION: Composite: Renders a magenta line between points (445, 171) and (56, 187) then Draws a purple rectangle at (300, 34) with width 84 and height 64.
; PLAN: r0=445(x1), r1=171(y1), r2=56(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=34(y), r7=84(width), r8=64(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 445
LDI r1, 171
LDI r2, 56
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 34
LDI r7, 84
LDI r8, 64
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
