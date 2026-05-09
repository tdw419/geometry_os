; DESCRIPTION: Composite: Renders a black line between points (484, 135) and (45, 70) then Renders a purple box of size 114x33 starting at (48, 192).
; PLAN: r0=484(x1), r1=135(y1), r2=45(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=48(x), r6=192(y), r7=114(width), r8=33(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 484
LDI r1, 135
LDI r2, 45
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 48
LDI r6, 192
LDI r7, 114
LDI r8, 33
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
