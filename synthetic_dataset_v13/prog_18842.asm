; DESCRIPTION: Composite: Places a green 53x65 rectangle at position (339, 87) then Draws a green line from (483, 187) to (9, 138).
; PLAN: r0=339(x), r1=87(y), r2=53(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=483(x1), r6=187(y1), r7=9(x2), r8=138(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 339
LDI r1, 87
LDI r2, 53
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 483
LDI r6, 187
LDI r7, 9
LDI r8, 138
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
