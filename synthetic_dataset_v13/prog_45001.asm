; DESCRIPTION: Composite: Renders a green line between points (447, 16) and (82, 204) then Draws a green rectangle at (275, 92) with width 116 and height 90.
; PLAN: r0=447(x1), r1=16(y1), r2=82(x2), r3=204(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=275(x), r6=92(y), r7=116(width), r8=90(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 447
LDI r1, 16
LDI r2, 82
LDI r3, 204
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 92
LDI r7, 116
LDI r8, 90
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
