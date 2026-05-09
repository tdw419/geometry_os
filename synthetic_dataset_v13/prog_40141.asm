; DESCRIPTION: Composite: Sets a single cyan pixel at (58, 35) then Renders a red line between points (320, 22) and (507, 20).
; PLAN: r0=58(x), r1=35(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=320(x1), r6=22(y1), r7=507(x2), r8=20(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 35
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 320
LDI r6, 22
LDI r7, 507
LDI r8, 20
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
