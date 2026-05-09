; DESCRIPTION: Composite: Draws a black rectangle at (202, 84) with width 98 and height 98 then Places a red line segment connecting (117, 116) to (400, 57).
; PLAN: r0=202(x), r1=84(y), r2=98(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x1), r6=116(y1), r7=400(x2), r8=57(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 84
LDI r2, 98
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 116
LDI r7, 400
LDI r8, 57
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
