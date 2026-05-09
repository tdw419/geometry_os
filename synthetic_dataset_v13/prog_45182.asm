; DESCRIPTION: Composite: Renders a cyan line between points (275, 71) and (389, 227) then Draws a orange rectangle at (12, 163) with width 76 and height 52.
; PLAN: r0=275(x1), r1=71(y1), r2=389(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=12(x), r6=163(y), r7=76(width), r8=52(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 275
LDI r1, 71
LDI r2, 389
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 12
LDI r6, 163
LDI r7, 76
LDI r8, 52
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
