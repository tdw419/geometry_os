; DESCRIPTION: Composite: Draws a purple rectangle at (18, 127) with width 98 and height 57 then Draws a magenta line from (270, 124) to (72, 124).
; PLAN: r0=18(x), r1=127(y), r2=98(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=270(x1), r6=124(y1), r7=72(x2), r8=124(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 18
LDI r1, 127
LDI r2, 98
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 124
LDI r7, 72
LDI r8, 124
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
