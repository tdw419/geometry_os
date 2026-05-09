; DESCRIPTION: Composite: Places a cyan 57x83 rectangle at position (115, 80) then Draws a green line from (252, 147) to (246, 78) then Places a magenta dot at position (96, 240).
; PLAN: r0=115(x), r1=80(y), r2=57(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=252(x1), r6=147(y1), r7=246(x2), r8=78(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=96(x), r11=240(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 115
LDI r1, 80
LDI r2, 57
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 147
LDI r7, 246
LDI r8, 78
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 240
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
