; DESCRIPTION: Composite: Draws a purple line from (197, 228) to (410, 235) then Draws a purple rectangle at (127, 44) with width 89 and height 100.
; PLAN: r0=197(x1), r1=228(y1), r2=410(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=127(x), r6=44(y), r7=89(width), r8=100(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 197
LDI r1, 228
LDI r2, 410
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 44
LDI r7, 89
LDI r8, 100
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
