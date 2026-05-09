; DESCRIPTION: Composite: Places a green line segment connecting (258, 132) to (93, 93) then Places a cyan 30x74 rectangle at position (47, 83).
; PLAN: r0=258(x1), r1=132(y1), r2=93(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=47(x), r6=83(y), r7=30(width), r8=74(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 258
LDI r1, 132
LDI r2, 93
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 47
LDI r6, 83
LDI r7, 30
LDI r8, 74
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
