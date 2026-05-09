; DESCRIPTION: Composite: Draws a cyan rectangle at (59, 83) with width 34 and height 23 then Renders a red line between points (457, 177) and (399, 125).
; PLAN: r0=59(x), r1=83(y), r2=34(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=457(x1), r6=177(y1), r7=399(x2), r8=125(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 59
LDI r1, 83
LDI r2, 34
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 177
LDI r7, 399
LDI r8, 125
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
