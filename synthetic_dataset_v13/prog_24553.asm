; DESCRIPTION: Composite: Places a magenta 98x93 rectangle at position (142, 76) then Renders a red line between points (23, 180) and (260, 90).
; PLAN: r0=142(x), r1=76(y), r2=98(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=23(x1), r6=180(y1), r7=260(x2), r8=90(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 142
LDI r1, 76
LDI r2, 98
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 180
LDI r7, 260
LDI r8, 90
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
