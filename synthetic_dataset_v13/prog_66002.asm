; DESCRIPTION: Composite: Renders a cyan line between points (328, 41) and (221, 16) then Draws a black rectangle at (340, 24) with width 102 and height 91.
; PLAN: r0=328(x1), r1=41(y1), r2=221(x2), r3=16(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=340(x), r6=24(y), r7=102(width), r8=91(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 328
LDI r1, 41
LDI r2, 221
LDI r3, 16
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 24
LDI r7, 102
LDI r8, 91
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
