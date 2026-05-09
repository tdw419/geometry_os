; DESCRIPTION: Composite: Places a cyan line segment connecting (106, 138) to (247, 160) then Draws a cyan rectangle at (200, 171) with width 35 and height 60.
; PLAN: r0=106(x1), r1=138(y1), r2=247(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=171(y), r7=35(width), r8=60(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 106
LDI r1, 138
LDI r2, 247
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 171
LDI r7, 35
LDI r8, 60
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
