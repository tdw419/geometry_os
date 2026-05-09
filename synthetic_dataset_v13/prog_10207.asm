; DESCRIPTION: Composite: Draws a cyan rectangle at (119, 197) with width 56 and height 15 then Draws a yellow line from (11, 245) to (73, 94).
; PLAN: r0=119(x), r1=197(y), r2=56(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=11(x1), r6=245(y1), r7=73(x2), r8=94(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 119
LDI r1, 197
LDI r2, 56
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 245
LDI r7, 73
LDI r8, 94
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
