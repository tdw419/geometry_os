; DESCRIPTION: Composite: Renders a cyan line between points (253, 54) and (95, 252) then Draws a red rectangle at (84, 98) with width 48 and height 84.
; PLAN: r0=253(x1), r1=54(y1), r2=95(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=84(x), r6=98(y), r7=48(width), r8=84(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 253
LDI r1, 54
LDI r2, 95
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 98
LDI r7, 48
LDI r8, 84
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
