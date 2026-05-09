; DESCRIPTION: Composite: Draws a green line from (484, 12) to (509, 255) then Draws a red rectangle at (56, 225) with width 49 and height 12.
; PLAN: r0=484(x1), r1=12(y1), r2=509(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=56(x), r6=225(y), r7=49(width), r8=12(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 484
LDI r1, 12
LDI r2, 509
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 225
LDI r7, 49
LDI r8, 12
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
