; DESCRIPTION: Composite: Renders a cyan box of size 18x94 starting at (324, 112) then Renders a cyan line between points (120, 106) and (259, 116).
; PLAN: r0=324(x), r1=112(y), r2=18(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x1), r6=106(y1), r7=259(x2), r8=116(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 324
LDI r1, 112
LDI r2, 18
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 106
LDI r7, 259
LDI r8, 116
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
