; DESCRIPTION: Composite: Renders a blue box of size 81x36 starting at (171, 70) then Renders a white line between points (12, 180) and (83, 108).
; PLAN: r0=171(x), r1=70(y), r2=81(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=12(x1), r6=180(y1), r7=83(x2), r8=108(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 171
LDI r1, 70
LDI r2, 81
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 12
LDI r6, 180
LDI r7, 83
LDI r8, 108
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
