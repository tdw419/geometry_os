; DESCRIPTION: Composite: Places a cyan 56x68 rectangle at position (43, 75) then Renders a green line between points (272, 78) and (36, 139).
; PLAN: r0=43(x), r1=75(y), r2=56(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=272(x1), r6=78(y1), r7=36(x2), r8=139(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 43
LDI r1, 75
LDI r2, 56
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 78
LDI r7, 36
LDI r8, 139
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
