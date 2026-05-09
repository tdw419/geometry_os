; DESCRIPTION: Composite: Places a magenta 44x33 rectangle at position (385, 12) then Draws a green line from (216, 136) to (90, 223).
; PLAN: r0=385(x), r1=12(y), r2=44(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=216(x1), r6=136(y1), r7=90(x2), r8=223(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 385
LDI r1, 12
LDI r2, 44
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 136
LDI r7, 90
LDI r8, 223
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
