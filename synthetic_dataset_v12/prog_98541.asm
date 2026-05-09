; DESCRIPTION: Composite: Renders a green line between points (273, 120) and (488, 151) then Draws a green rectangle at (144, 149) with width 61 and height 84.
; PLAN: r0=273(x1), r1=120(y1), r2=488(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=144(x), r6=149(y), r7=61(width), r8=84(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 273
LDI r1, 120
LDI r2, 488
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 149
LDI r7, 61
LDI r8, 84
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
