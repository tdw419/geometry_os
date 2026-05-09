; DESCRIPTION: Composite: Renders a cyan line between points (222, 142) and (288, 90) then Draws a green rectangle at (173, 102) with width 98 and height 20.
; PLAN: r0=222(x1), r1=142(y1), r2=288(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=173(x), r6=102(y), r7=98(width), r8=20(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 222
LDI r1, 142
LDI r2, 288
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 102
LDI r7, 98
LDI r8, 20
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
