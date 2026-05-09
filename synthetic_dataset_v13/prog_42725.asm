; DESCRIPTION: Composite: Places a white line segment connecting (73, 109) to (99, 214) then Places a yellow 55x118 rectangle at position (5, 119).
; PLAN: r0=73(x1), r1=109(y1), r2=99(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=5(x), r6=119(y), r7=55(width), r8=118(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 73
LDI r1, 109
LDI r2, 99
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 119
LDI r7, 55
LDI r8, 118
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
