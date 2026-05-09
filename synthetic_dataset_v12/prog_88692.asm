; DESCRIPTION: Composite: Draws a black rectangle at (24, 0) with width 108 and height 54 then Renders a cyan line between points (358, 37) and (454, 130).
; PLAN: r0=24(x), r1=0(y), r2=108(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=358(x1), r6=37(y1), r7=454(x2), r8=130(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 24
LDI r1, 0
LDI r2, 108
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 37
LDI r7, 454
LDI r8, 130
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
