; DESCRIPTION: Composite: Creates a red circular shape at (95, 175) with radius 25 then Draws a cyan line from (449, 50) to (313, 119).
; PLAN: r0=95(x), r1=175(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=449(x1), r6=50(y1), r7=313(x2), r8=119(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 175
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 449
LDI r6, 50
LDI r7, 313
LDI r8, 119
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
