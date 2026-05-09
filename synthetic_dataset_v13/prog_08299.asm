; DESCRIPTION: Composite: Places a green line segment connecting (292, 135) to (53, 145) then Places a cyan 34x60 rectangle at position (418, 23).
; PLAN: r0=292(x1), r1=135(y1), r2=53(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=418(x), r6=23(y), r7=34(width), r8=60(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 292
LDI r1, 135
LDI r2, 53
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 23
LDI r7, 34
LDI r8, 60
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
