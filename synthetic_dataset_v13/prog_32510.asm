; DESCRIPTION: Composite: Places a black line segment connecting (317, 212) to (313, 127) then Places a magenta 66x61 rectangle at position (423, 83).
; PLAN: r0=317(x1), r1=212(y1), r2=313(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=423(x), r6=83(y), r7=66(width), r8=61(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 317
LDI r1, 212
LDI r2, 313
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 83
LDI r7, 66
LDI r8, 61
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
