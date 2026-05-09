; DESCRIPTION: Composite: Draws a yellow rectangle at (397, 153) with width 18 and height 83 then Places a white line segment connecting (0, 152) to (319, 135).
; PLAN: r0=397(x), r1=153(y), r2=18(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=0(x1), r6=152(y1), r7=319(x2), r8=135(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 397
LDI r1, 153
LDI r2, 18
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 152
LDI r7, 319
LDI r8, 135
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
