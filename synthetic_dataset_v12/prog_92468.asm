; DESCRIPTION: Composite: Draws a blue line from (165, 172) to (341, 134) then Creates a white rectangular region at (27, 200) spanning 117 by 38 pixels.
; PLAN: r0=165(x1), r1=172(y1), r2=341(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=27(x), r6=200(y), r7=117(width), r8=38(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 165
LDI r1, 172
LDI r2, 341
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 200
LDI r7, 117
LDI r8, 38
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
