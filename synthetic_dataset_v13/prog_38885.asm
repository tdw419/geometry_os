; DESCRIPTION: Composite: Draws a black line from (134, 59) to (422, 228) then Draws a black rectangle at (359, 112) with width 81 and height 44.
; PLAN: r0=134(x1), r1=59(y1), r2=422(x2), r3=228(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=359(x), r6=112(y), r7=81(width), r8=44(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 134
LDI r1, 59
LDI r2, 422
LDI r3, 228
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 112
LDI r7, 81
LDI r8, 44
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
