; DESCRIPTION: Composite: Places a black 73x50 rectangle at position (314, 93) then Places a orange line segment connecting (24, 14) to (70, 124).
; PLAN: r0=314(x), r1=93(y), r2=73(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=24(x1), r6=14(y1), r7=70(x2), r8=124(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 314
LDI r1, 93
LDI r2, 73
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 14
LDI r7, 70
LDI r8, 124
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
