; DESCRIPTION: Composite: Renders a cyan line between points (410, 179) and (466, 194) then Renders a black box of size 58x104 starting at (157, 4).
; PLAN: r0=410(x1), r1=179(y1), r2=466(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=157(x), r6=4(y), r7=58(width), r8=104(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 410
LDI r1, 179
LDI r2, 466
LDI r3, 194
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 4
LDI r7, 58
LDI r8, 104
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
