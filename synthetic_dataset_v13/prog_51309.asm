; DESCRIPTION: Composite: Places a cyan line segment connecting (272, 182) to (95, 247) then Places a green 80x89 rectangle at position (284, 89).
; PLAN: r0=272(x1), r1=182(y1), r2=95(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=284(x), r6=89(y), r7=80(width), r8=89(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 272
LDI r1, 182
LDI r2, 95
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 89
LDI r7, 80
LDI r8, 89
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
