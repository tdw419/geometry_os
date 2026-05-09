; DESCRIPTION: Composite: Creates a red circular shape at (58, 193) with radius 41 then Draws a cyan line from (4, 75) to (398, 202).
; PLAN: r0=58(x), r1=193(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=4(x1), r6=75(y1), r7=398(x2), r8=202(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 193
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 4
LDI r6, 75
LDI r7, 398
LDI r8, 202
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
