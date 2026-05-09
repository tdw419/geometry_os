; DESCRIPTION: Composite: Places a white line segment connecting (99, 184) to (477, 76) then Places a yellow 71x33 rectangle at position (292, 70).
; PLAN: r0=99(x1), r1=184(y1), r2=477(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=292(x), r6=70(y), r7=71(width), r8=33(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 99
LDI r1, 184
LDI r2, 477
LDI r3, 76
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 70
LDI r7, 71
LDI r8, 33
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
