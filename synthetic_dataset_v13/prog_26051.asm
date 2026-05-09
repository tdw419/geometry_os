; DESCRIPTION: Composite: Renders a cyan box of size 31x34 starting at (33, 76) then Places a green line segment connecting (14, 97) to (423, 197).
; PLAN: r0=33(x), r1=76(y), r2=31(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=14(x1), r6=97(y1), r7=423(x2), r8=197(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 33
LDI r1, 76
LDI r2, 31
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 97
LDI r7, 423
LDI r8, 197
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
