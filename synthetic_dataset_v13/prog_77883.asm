; DESCRIPTION: Composite: Renders a magenta line between points (288, 98) and (355, 149) then Draws a white rectangle at (50, 125) with width 51 and height 102.
; PLAN: r0=288(x1), r1=98(y1), r2=355(x2), r3=149(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=50(x), r6=125(y), r7=51(width), r8=102(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 288
LDI r1, 98
LDI r2, 355
LDI r3, 149
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 125
LDI r7, 51
LDI r8, 102
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
