; DESCRIPTION: Composite: Places a purple 66x112 rectangle at position (444, 108) then Places a yellow line segment connecting (98, 76) to (106, 119).
; PLAN: r0=444(x), r1=108(y), r2=66(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=98(x1), r6=76(y1), r7=106(x2), r8=119(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 444
LDI r1, 108
LDI r2, 66
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 76
LDI r7, 106
LDI r8, 119
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
