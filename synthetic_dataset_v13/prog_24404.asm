; DESCRIPTION: Composite: Places a blue 88x102 rectangle at position (70, 121) then Draws a orange line from (193, 140) to (317, 235).
; PLAN: r0=70(x), r1=121(y), r2=88(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=193(x1), r6=140(y1), r7=317(x2), r8=235(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 70
LDI r1, 121
LDI r2, 88
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 140
LDI r7, 317
LDI r8, 235
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
