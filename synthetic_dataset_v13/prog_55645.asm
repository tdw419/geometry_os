; DESCRIPTION: Composite: Draws a cyan rectangle at (316, 2) with width 83 and height 21 then Renders a cyan line between points (258, 247) and (503, 174).
; PLAN: r0=316(x), r1=2(y), r2=83(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=258(x1), r6=247(y1), r7=503(x2), r8=174(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 316
LDI r1, 2
LDI r2, 83
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 247
LDI r7, 503
LDI r8, 174
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
