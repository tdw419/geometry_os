; DESCRIPTION: Composite: Draws a cyan line from (260, 89) to (264, 231) then Draws a green rectangle at (417, 127) with width 74 and height 58.
; PLAN: r0=260(x1), r1=89(y1), r2=264(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=417(x), r6=127(y), r7=74(width), r8=58(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 89
LDI r2, 264
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 127
LDI r7, 74
LDI r8, 58
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
