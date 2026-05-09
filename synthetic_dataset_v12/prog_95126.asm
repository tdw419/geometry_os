; DESCRIPTION: Composite: Draws a blue rectangle at (341, 89) with width 57 and height 119 then Renders a cyan line between points (130, 128) and (110, 37).
; PLAN: r0=341(x), r1=89(y), r2=57(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x1), r6=128(y1), r7=110(x2), r8=37(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 341
LDI r1, 89
LDI r2, 57
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 128
LDI r7, 110
LDI r8, 37
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
