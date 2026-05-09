; DESCRIPTION: Composite: Renders a red box of size 106x80 starting at (220, 84) then Renders a black line between points (449, 169) and (48, 81).
; PLAN: r0=220(x), r1=84(y), r2=106(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=449(x1), r6=169(y1), r7=48(x2), r8=81(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 220
LDI r1, 84
LDI r2, 106
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 169
LDI r7, 48
LDI r8, 81
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
