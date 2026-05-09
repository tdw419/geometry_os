; DESCRIPTION: Composite: Places a cyan line segment connecting (496, 199) to (106, 98) then Places a green 65x10 rectangle at position (276, 10).
; PLAN: r0=496(x1), r1=199(y1), r2=106(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=276(x), r6=10(y), r7=65(width), r8=10(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 496
LDI r1, 199
LDI r2, 106
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 10
LDI r7, 65
LDI r8, 10
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
