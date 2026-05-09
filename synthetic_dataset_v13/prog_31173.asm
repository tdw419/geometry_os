; DESCRIPTION: Composite: Places a magenta 84x44 rectangle at position (47, 142) then Draws a blue line from (221, 199) to (111, 78).
; PLAN: r0=47(x), r1=142(y), r2=84(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=221(x1), r6=199(y1), r7=111(x2), r8=78(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 47
LDI r1, 142
LDI r2, 84
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 199
LDI r7, 111
LDI r8, 78
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
